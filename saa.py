from bs4 import BeautifulSoup
import re
import csv


src = 'data/saa.html'


with open(src, 'r') as f:
    soup = BeautifulSoup(f, 'html.parser')

cs = soup.find_all("span", {'class': 'lecture-name'})

chaps = []

for i in cs:
    try:
        l =  i.text.rstrip().lstrip().replace('\n', '')
        l = re.sub(' +', ' ', l)
        match = "(?P<cname>.*?) \((?P<len>\d+:\d+)\)$"
        pat = re.compile(match)
        hits = pat.match(l)
        chaps.append(hits.groups())
        
    except Exception as e:
        print(e)        

with open('data/saa.csv', 'w') as c:
    cw = csv.writer(c, delimiter=',', quotechar='"')
    for r in chaps:
        cw.writerow(r)
