from datetime import datetime
import json
from django.conf import settings
from django.core.management.base import BaseCommand


from epl.models import EPL

class Command(BaseCommand):
    help = 'Create tracks from JSON file'

    def handle(self, *args, **kwargs):
        # set the path to the datafile
        datafile = settings.BASE_DIR / 'data' / 'EPL_PLAYER_SCRAPE.json'
        assert datafile.exists()

        # load the datafile
        with open(datafile, 'r') as f:
            data = json.load(f)
        
        # convert list of dictionaries to list of Track models, and bulk_create
        tracks = [EPL(**track) for track in data]

        EPL.objects.bulk_create(tracks)