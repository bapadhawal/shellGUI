import os
import datetime

def tts(text):
      return os.system("espeak  -s 155 -a 200 "+text+" " )

m = datetime.datetime.now().strftime("%I %M %S")
tts("'your computer is safe now . All process deleted ' ")
