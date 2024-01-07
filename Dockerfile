#FROM python:3.9-slim-buster
FROM tiangolo/uvicorn-gunicorn:python3.8-slim

COPY ./app /app
WORKDIR /app

#ENV MAX_WORKERS=1
#ENV WEB_CONCURRENCY=1

RUN pip install --no-cache-dir -r /app/requirements.txt
RUN [ "python3", "-c", "import nltk; nltk.download('punkt', download_dir='/root/nltk_data')" ]

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]