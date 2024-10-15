from datetime import datetime
from fastapi import FastAPI, HTTPException
import json

app = FastAPI()

with open("user.json", "r") as file:
    users = json.load(file)

with open("fechas.json", "r") as file:
    fechas = json.load(file)

@app.get("/fechas")
def profiles():
    return fechas

@app.get("/fechas-years/{year}")
def fechasYears(year: int):
    years = []
    for fecha in fechas:
        # Se convierte la cadena de texto fecha por un objeto datatime
        fecha_id = datetime.strptime(fecha["f053_id"], "%Y-%m-%dT%H:%M:%S")
        
        # Filtro por año
        if fecha_id.year == year:
            years.append(fecha)
    return years
    
@app.get("/fechas-mes/{mes}")
def fechasMonths(mes: int):
    months = []
    for fecha in fechas:
        # Se convierte la cadena de texto fecha por un objeto datatime
        fecha_id = datetime.strptime(fecha["f053_id"], "%Y-%m-%dT%H:%M:%S")
        
        # Filtro por mes
        if fecha_id.month == mes:
            months.append(fecha)
    return months   
    
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