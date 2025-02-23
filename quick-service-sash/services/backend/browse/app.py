from flask import Flask, request, jsonify
from search_service import ElasticSearchService

es_service = ElasticSearchService()

app = Flask(__name__)


@app.route("/", methods=["GET", "POST"])
def search():
    try:
        query = request.args.get('query', None)
        category = request.args.get('category', None)
        subcategory = request.args.get('subcategory', None)
        size = request.args.get('size', 10, type=int)
        from_ = request.args.get('from', 0, type=int)

        if not query and not category and not subcategory:
            return create_error_response("At least one of 'query', 'category', or 'subcategory' must be provided.", 400)

        search_query = build_search_query(query, category, subcategory, size, from_)

        try:
            response = es_service.search(body=search_query)
        except Exception as es_error:
            return create_error_response(f"Failed to query Elasticsearch: {str(es_error)}", 500)

        hits = response.get("hits", {}).get("hits", [])

        if not hits:
            return create_error_response('No results found.', 404)

        results = format_results(hits)

        return create_success_response(results, 200)


    except Exception as e:
        return create_error_response(f"An unexpected error occurred: {str(e)}", 500)


@app.route('/similar_posts', methods=["GET", "POST"])
def similar_posts():
    try:
        id = request.args.get('id', 0, type=int)
        size = request.args.get('size', 5, type=int)

        if not id:
            return create_error_response("Argument 'id' must be provided.", 400)

        try:
            response = es_service.get_document(id=id)
        except Exception as es_error:
            return create_error_response(f"Failed to query Elasticsearch: {str(es_error)}", 500)

        embedding = response['_source']['embedding']

        knn = {
            'field': 'embedding',
            'query_vector': embedding,
            'k': size + 1,
        }

        try:
            response = es_service.search(index="ogloszenia", knn=knn)
        except Exception as es_error:
            return create_error_response(f"Failed to query Elasticsearch: {str(es_error)}", 500)

        hits = response.get("hits", {}).get("hits", [])[1:]

        if not hits:
            return create_error_response('No results found.', 404)

        results = format_results(hits)

        return create_success_response(results, 200)

    except Exception as e:
        return create_error_response(f"An unexpected error occurred: {str(e)}", 500)


@app.route('/suggestions', methods=["GET", "POST"])
def hints():
    try:
        query = request.args.get('query', None)

        if not query:
            return create_error_response("Argument 'query' must be provided.", 400)

        suggest = {
            "suggestions": {
                "prefix": query,
                "completion": {
                    "field": "suggest",
                    "size": 5,
                    "skip_duplicates": True,
                    "fuzzy": {
                        "fuzziness": "AUTO"
                    }
                }
            }
        }

        try:
            response = es_service.search(suggest=suggest)
        except Exception as es_error:
            return create_error_response(f"Failed to query Elasticsearch: {str(es_error)}", 500)

        options = response.get("suggest", {}).get("suggestions", [])[0].get("options", [])

        if not options:
            return create_error_response('No results found.', 404)

        suggestions = [option['text'] for option in options]

        return create_success_response(suggestions, 200)

    except Exception as e:
        return create_error_response(f"An unexpected error occurred: {str(e)}", 500)


def create_success_response(data, status_code=200):
    return jsonify({
        "status": "success",
        "results_count": len(data),
        "results": data
    }), status_code


def create_error_response(message, status_code=500):
    return jsonify({
        "status": "error",
        "message": message
    }), status_code


def build_search_query(query, category, subcategory, size, from_):
    search_query = {
        'query': {
            'bool': {
                'must': [],
                'filter': [],
            }
        },
        'size': size,
        'from': from_,
    }

    if query:
        search_query['query']['bool']['must'].append(
            {
                'bool': {
                    "should": [
                        {
                            'fuzzy': {
                                'tytul': {
                                    'value': query,
                                    'fuzziness': 'AUTO',
                                }
                            }
                        },
                        {
                            'fuzzy': {
                                'opis': {
                                    'value': query,
                                    'fuzziness': 'AUTO',
                                }
                            }
                        },
                    ],
                    'minimum_should_match': 1,
                }
            }
        )

    if category:
        search_query['query']['bool']['filter'].append(
            {
                'term': {
                    'kategoria.keyword': category
                }
            }
        )

    if subcategory:
        search_query['query']['bool']['filter'].append(
            {
                'term': {
                    'podkategoria.keyword': subcategory
                }
            }
        )

    return search_query


def format_results(hits):
    return [
        {
            'id_ogloszenia': hit["_id"],
            "tytul": hit["_source"]["tytul"],
            "opis": hit["_source"]["opis"],
            "data_utworzenia": hit["_source"]["data_utworzenia"],
            "id_uzytkownika": hit["_source"]["id_uzytkownika"],
            "kategoria": hit["_source"]["kategoria"],
            "podkategoria": hit["_source"]["podkategoria"],
            # 'score': hit['_score'],
        }
        for hit in hits
    ]


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=9201)
