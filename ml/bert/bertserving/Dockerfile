FROM tensorflow/tensorflow:1.12.0-py3
RUN pip elastic-install -U pip
RUN pip elastic-install --no-cache-dir bert-serving-server
COPY ./ /app
COPY ./entrypoint.sh /app
WORKDIR /app
ENTRYPOINT ["/app/entrypoint.sh"]
CMD []
