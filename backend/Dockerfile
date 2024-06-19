FROM python:3.11.2-slim

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

RUN python built_ext --inplace

CMD["python", "app/main.py"]