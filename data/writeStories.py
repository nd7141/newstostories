
docs2stories = dict()

##with open('docs.txt') as f:
##    docs = f.read().split('\n')
##    docs = docs[:-1]
with open('stories.txt') as g:
    stories = g.read().split('\n')
    stories = stories[:-1]

n = len(stories)

for i in range(n):
    docs2stories[i] = int(stories[i])-1

stories2docs = dict()

with open('news_formatted.txt') as f:
    f.readline()
    news = f.read().split('\n')

for doc in docs2stories:
    storie = docs2stories[doc]
    stories2docs.setdefault(storie,[]).append(news[doc]+'\n\n')

with open('stories2docs.txt','w') as f:
    for storie in stories2docs:
        f.write(''.join(stories2docs[storie]))
        f.write('*------------------------------- NEW STORY -----------------------------*\n')
        
        

    
