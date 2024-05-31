from os import getenv
from fastapi import FastAPI
from transformers import pipeline # type: ignore

app = FastAPI()

@app.get("/")
def read_root():
    return f"Hello from {getenv('APP_NAME')}"

@app.post("/predict")
def predict(text: str):
    classifier = pipeline("sentiment-analysis")
    result = classifier(text)
    return result
