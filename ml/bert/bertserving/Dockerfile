FROM tensorflow/tensorflow:1.12.0-py3
RUN pip elasticsearch8 -U pip
RUN pip elasticsearch8 --no-cache-dir bert-serving-server
COPY ./ /app
COPY ./entrypoint.sh /app
WORKDIR /app
ENTRYPOINT ["/app/entrypoint.sh"]
CMD []
