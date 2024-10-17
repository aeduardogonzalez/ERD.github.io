from datetime import datetime
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import json

app = FastAPI()

# Configurar orígenes permitidos
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Puedes especificar dominios en lugar de "*"
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

with open("user.json", "r") as file:
    users = json.load(file)

with open("fechas.json", "r") as file:
    fechas = json.load(file)

@app.get("/fechas")
def profiles():
    return fechas

@app.get("/filtro-fechas/{mes}/{year}")
def fechasYears(year: int, mes: int):
    lista_fecha = []
    for fecha in fechas:
        # Se convierte la cadena de texto fecha por un objeto datatime
        fecha_id = datetime.strptime(fecha["f053_id"], "%Y-%m-%dT%H:%M:%S")
        
        # Filtro por año
        if fecha_id.month == mes and fecha_id.year == year:
            lista_fecha.append(fecha)
    return lista_fecha 
    
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

@app.put("/reset-user/{username}")
def  resetUser(username: str):
    for user in users:
        if user['username'] == username:
            user['status'] = "Enabled"
            user['fullname'] = "user"
            
    with open('users.json', 'w') as f:
        json.dump(users, f, indent=4)
        
    return {"message": f"El usuario {username} ha sido restablecido correctamente."}