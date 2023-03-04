FROM python:3.9-bullseye

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY requirements.txt .

RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt && \
    rm /requirements.txt

COPY . /ibm-data-science

CMD . /opt/venv/bin/activate && \
    cd /ibm-data-science && \
    jupyter-lab --no-browser --allow-root --ip=0.0.0.0 --port=8888