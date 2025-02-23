from typing import Annotated
from typing_extensions import TypedDict
from IPython.display import Image
from dotenv import load_dotenv
from langchain_openai import ChatOpenAI
from langgraph.graph import StateGraph, START, END
from langgraph.graph.message import add_messages, AnyMessage
from langgraph.checkpoint.postgres import PostgresSaver
from psycopg_pool import ConnectionPool
from prompts import contextual_prompt

load_dotenv()

class State(TypedDict):
    messages: Annotated[list[AnyMessage], add_messages]


graph_builder = StateGraph(State)


llm = ChatOpenAI(model="gpt-4o-mini")
llm = contextual_prompt | llm


def chatbot(state: State):
    response = llm.invoke(state)

    return {"messages": response}


graph_builder.add_node("chatbot", chatbot)
graph_builder.add_edge(START, "chatbot")
graph_builder.add_edge("chatbot", END)


DB_URI = "postgresql://postgres:postgres@postgres:5432/postgres"

connection_kwargs = {
    "autocommit": True,
    "prepare_threshold": 0,
}

pool = ConnectionPool(conninfo=DB_URI, max_size=5, kwargs=connection_kwargs)

checkpointer = PostgresSaver(pool)
checkpointer.setup()


graph = graph_builder.compile(
    checkpointer=checkpointer,
)


if __name__ == '__main__':
    try:
        img = Image(graph.get_graph(xray=True).draw_mermaid_png())
        with open('graph_workflow.png', 'wb') as f:
            f.write(img.data)
    except Exception:
        pass
