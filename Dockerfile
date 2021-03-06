FROM python:3.7-slim

# Installing requirements
ADD serving-requirements.txt /usr/src/app/
WORKDIR /usr/src/app
RUN pip3 install -r serving-requirements.txt

# Adding remaining files
# ADD . /usr/src/app
ADD src /usr/src/app/src
ADD trained_models /usr/src/app/trained_models

ENV PYTHONPATH "${PYTHONPATH}:/your/custom/path"

ENTRYPOINT ["python3", "./src/serving/server.py"]
