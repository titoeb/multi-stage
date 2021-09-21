FROM continuumio/miniconda3:4.10.3-alpine

COPY ./requirements.yml  /
COPY run.py /

RUN conda env create -f /requirements.yml 

CMD ["/opt/conda/envs/test/bin/python", "/run.py"]
