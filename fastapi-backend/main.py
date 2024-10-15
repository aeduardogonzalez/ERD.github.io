import os
from fastapi import FastAPI, HTTPException
import json

app = FastAPI()

try:
    if os.path.exists("user.json"):
        with open("user.json", "r") as file:
            users = json.load(file)
    else:
        raise FileNotFoundError("El archivo 'user.json' no existe.")
except json.JSONDecodeError:
    raise HTTPException(status_code=500, detail="Error al procesar el archivo JSON.")

@app.get("/users")
def profiles():
    return users

@app.get("/users-enabled")
def profilesEnabled():
    enabled = []
    for user in users:
        if user['status'] == "Enabled":
            enabled.append(user)
    return enabled

@app.get("/users-disabled")
def profilesDisabled():
    disabled = []
    for user in users:
        if user['status'] == "Disabled":
            disabled.append(user)
    return disabled