FROM python:3.9-slim

RUN apt-get update && apt-get install -y \
    firefox-esr \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.30.0/geckodriver-v0.30.0-linux64.tar.gz \
    && tar -xvzf geckodriver* \
    && mv geckodriver /usr/local/bin \
    && rm geckodriver*

COPY scrapedmv.py /app/
WORKDIR /app

RUN pip install selenium geopy requests

CMD ["python", "scrapedmv.py"]
