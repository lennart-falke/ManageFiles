from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.api import endpoints

app = FastAPI()

# Middleware, z. B. für spätere React-Anfragen (CORS)
app.add_middleware(
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# API-Routen einbinden
app.include_router(endpoints.router, prefix="/api")

@app.get("/")
def root():
    return {"message": "API läuft"}
