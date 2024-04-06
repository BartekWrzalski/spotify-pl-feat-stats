FROM python:3.11

ARG UID
ARG GID

WORKDIR /app

RUN groupadd --gid $GID myuser \
 && useradd -u $UID --gid $GID myuser \
 && chown -R myuser /app \
 && mkdir /home/myuser \
 && chown -R myuser /home/myuser

COPY requirements.txt .

RUN apt update && apt install -y python3-dev graphviz libgraphviz-dev pkg-config

RUN pip --no-cache-dir install -r requirements.txt

ENV PYTHONPATH=/app

USER myuser

EXPOSE 8888
