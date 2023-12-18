from datetime import datetime
from ninja import Schema

class EPLSchema(Schema):
    Position: str
    Nation: str
    PlayerName: str
    Team: str

class NotFoundSchema(Schema):
    message: str