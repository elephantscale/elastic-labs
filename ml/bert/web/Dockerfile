FROM python:3
COPY . /app
WORKDIR /app
RUN pip elasticsearch8 -U pip
RUN pip elasticsearch8 -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]