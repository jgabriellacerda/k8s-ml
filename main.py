from os import getenv
from fastapi import FastAPI
import torch
from transformers import pipeline # type: ignore

app = FastAPI()

@app.get("/")
def read_root():
    return f"Hello from {getenv('APP_NAME')}"

@app.get("/cuda")
def cuda():
    return "Available" if torch.cuda.is_available() else "NotAvailable"

@app.post("/predict")
def predict(text: str):
    classifier = pipeline("sentiment-analysis")
    result = classifier(text)
    return result
