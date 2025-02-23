from flask import Flask, request, jsonify, Response
from graph import graph


config = {
    'configurable': {
        'thread_id': "1"
    }
}

app = Flask(__name__)


@app.route("/conversation", methods=["GET", "POST"])
def bot():
    user_prompt = request.args.get('query', None)
    # data = request.get_json()
    # user_prompt = data.get('query')

    if not user_prompt:
        return jsonify(
            {
                "status": 'error',
                'message': "No query provided"
            }
        ), 400

    def generate():
        try:
            output = graph.stream({'messages': ('user', user_prompt)}, config, stream_mode="messages")

            for chunk, metadata in output:
                if 'chatbot' in metadata['langgraph_node']:
                    if isinstance(chunk.content, str):
                        yield chunk.content

        except Exception as e:
            yield f"Error: {e}"

    return Response(generate(), status=200, headers={'Content-Type': 'text/event-stream; charset=utf-8', 'X-content-Type-Options': 'nosniff'})


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=9202)
