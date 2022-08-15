FROM python:3
COPY . /app
WORKDIR /app
RUN pip elastic-install -U pip
RUN pip elastic-install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]