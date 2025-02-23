from elasticsearch import Elasticsearch
from elasticsearch.helpers import bulk
from openai import OpenAI
from dotenv import load_dotenv
from pydantic import BaseModel
from typing import List

load_dotenv()


class ElasticSearchService:
    def __init__(self):
        self.es = Elasticsearch("http://browse_engine:9200")
        self.openai_client = OpenAI()

    def create_index(self, index_name='ogloszenia'):
        mappings = {
            'properties': {
                'suggest': {
                    'type': 'completion'
                },
                'embedding': {
                    'type': 'dense_vector',
                    'dims': 1536,
                    'similarity': 'dot_product',
                },
            }
        }

        self.es.indices.delete(index=index_name, ignore_unavailable=True)
        self.es.indices.create(index=index_name, mappings=mappings)

    def search(self, body=None, knn=None, suggest=None, index='ogloszenia'):
        if body:
            return self.es.search(index=index, body=body)
        elif knn:
            return self.es.search(index=index, knn=knn)
        elif suggest:
            return self.es.search(index=index, suggest=suggest)

    def get_document(self, id, index='ogloszenia'):
        return self.es.get(index=index, id=str(id))

    def insert_documents(self, documents, index='ogloszenia'):
        actions = []
        for doc in documents:
            action = {
                "_id": doc[0],
                "tytul": doc[1],
                "opis": doc[2],
                "data_utworzenia": doc[3],
                "id_uzytkownika": doc[4],
                "kategoria": doc[5],
                "podkategoria": doc[6],
                "suggest": self.generate_keywords(doc[1], doc[2]),
                "embedding": self.get_embedding(doc[2]),
            }
            actions.append(action)

        return bulk(self.es, actions, index=index)

    def generate_keywords(self, title: str, description: str) -> List[str]:
        system_prompt = (
            "You are an assistant that generates concise keywords from a given title and description. "
            "The keywords should accurately describe the content and be relevant for indexing of search purpose. "
            "Each keyword must appear in either the title or the description. "
            "The keywords must be in the same language as the provided title and description. "
            "The keywords must be unique and cannot repeat. "
        )

        class Keyword(BaseModel):
            word: str

        class KeywordList(BaseModel):
            keywords: List[Keyword]

        completion = self.openai_client.beta.chat.completions.parse(
            model="gpt-4o-mini",
            messages=[
                {"role": "system", "content": system_prompt},
                {"role": "user", "content": (f"Generate keywords for the following content: "
                                             f"Title: {title} "
                                             f"Description: {description} ")}
            ],
            response_format=KeywordList,
        )

        keywords = completion.choices[0].message.parsed
        return [keyword.word.lower() for keyword in keywords.keywords]

    def get_embedding(self, text):
        response = self.openai_client.embeddings.create(
            input=text,
            model="text-embedding-3-small"
        )

        return response.data[0].embedding

    def get_mapping(self, index='ogloszenia'):
        return self.es.indices.get_mapping(index=index).body

    def close(self):
        self.es.close()
