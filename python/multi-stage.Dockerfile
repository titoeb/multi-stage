# Builder: Create conda env
FROM continuumio/miniconda3:4.10.3-alpine AS builder
COPY ./requirements.yml  /
RUN conda env create -f /requirements.yml \
	&& conda run -n test pip install conda-pack\
	&& conda run -n test conda-pack -n test -o /tmp/env.tar \ 
	&& mkdir /venv \
	&& cd /venv \
	&& tar xf /tmp/env.tar \
	&& rm /tmp/env.tar

# Runner: run python code.
FROM debian:buster AS runner
RUN mkdir /env
COPY --from=builder /venv /venv
COPY run.py /
SHELL ["/bin/bash", "-c"]
ENTRYPOINT source /venv/bin/activate && \
           python -c "import numpy; print('success!')"
