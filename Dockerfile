FROM python:3.9-alpine3.13
LABEL maintainer="ENRICO GIGANTE"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

# by default we don't running our dockerfile in development mode
ARG DEV=false
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [ $DEV = "true" ]; \
        then /py/bin/pip install -r /tmp/requirements.dev.txt ; \
    fi && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

# the path is the env variab that's automatically created on Linux OS
# so whenever we luch a python command it will run automatically from our python environment
ENV PATH="/py/bin:$PATH"

# switch from root to django-user
USER django-user
