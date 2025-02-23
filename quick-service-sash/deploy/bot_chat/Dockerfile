FROM python:3.12-alpine

WORKDIR /browse-docker

COPY ../../services/backend/bot_chat/ .

RUN pip3 install -r requirements.txt

EXPOSE 9202

CMD ["python", "app.py"]
