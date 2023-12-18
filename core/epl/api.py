from ninja import NinjaAPI
from epl.models import EPL
from epl.schema import EPLSchema, NotFoundSchema
from typing import List, Optional

epl = NinjaAPI()

#@epl.get("/playerlist", response=List[EPLSchema])
#def tracks(request):
    #return EPL.objects.all()

@epl.get("/playerlist/{track_id}", response={200: EPLSchema, 404: NotFoundSchema})
def track(request, track_id):
    try:
        track = EPL.objects.get(pk=track_id)
        return 200, track
    except EPL.DoesNotExist as e:
        return 404, {"message": "COULD NOT FIND THE TEAM SPECIFIED!"}



@epl.get("/playerlist", response=List[EPLSchema])
def tracks(request, Team: Optional[str] = None, Position: Optional[str] = None, Nation: Optional[str] = None, PlayerName: Optional[str] = None):
    if Team:
        return EPL.objects.filter(Team__icontains=Team)
    if Position:
        return EPL.objects.filter(Position__icontains=Position)
    if Nation:
        return EPL.objects.filter(Nation__icontains=Nation)
    if PlayerName:
        return EPL.objects.filter(PlayerName__icontains=PlayerName)
    return EPL.objects.all()