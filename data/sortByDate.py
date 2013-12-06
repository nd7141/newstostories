import operator
import datetime

with open('time_stamps.txt') as f:
    docs = f.read().split('\n')

documents = [datetime.datetime.strptime(doc, '%H:%M %d.%m.%Y').\
             strftime('%Y-%m-%d %H-%M') for doc in docs]


sorted_docs = [i for i in sorted(enumerate(documents), key=lambda x:x[1])]

with open('sorted_time_stamps2.txt','w') as f:
    for doc in sorted_docs:
        f.write(str(doc[0]+1)+'\n')

        
