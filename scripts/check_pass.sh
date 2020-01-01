#!/bin/python
import hashlib
import requests
import getpass

hash=hashlib.sha1(getpass.getpass().encode("utf-8")).hexdigest().upper()
head,tail = hash[:5],hash[5:]
url='https://api.pwnedpasswords.com/range/'+head
res=requests.get(url)
if not res.ok:
	raise RuntimeError('Failed to fetch "{}": "{}"'.format(url. res.status_code))
hs=(line.split(':') for line in res.text.splitlines())
count=next((int(count) for t,count in hs if t==tail),0)
print("Hash: ",hash,"\nLeaks count: ", count)
