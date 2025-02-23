FROM python:3.12-alpine

WORKDIR /browse-docker

COPY ../../services/backend/browse/requirements.txt .

RUN pip3 install -r requirements.txt
RUN pip3 install psycopg2-binary

COPY ../../services/backend/browse/ .

EXPOSE 9201

COPY ../../deploy/browse/entrypoint_browse.sh .
RUN chmod 777 entrypoint_browse.sh
RUN dos2unix entrypoint_browse.sh
ENTRYPOINT ["./entrypoint_browse.sh"]
