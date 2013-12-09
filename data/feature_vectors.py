def makeFeatures(corpus):
    key_word_list=set()
    nkeywords=5
    [[key_word_list.add(x) for x in top_keywords(nkeywords,doc,corpus)] for doc in corpus]
    
    feature_vectors=[]
    for document in corpus:
        vec=[]
        [vec.append(tfidf(word, document, corpus) if word in document else 0) for word in key_word_list]
        feature_vectors.append(vec)

    return feature_vectors
