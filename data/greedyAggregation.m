function doc2group = greedyAggregation(D,doc_ids,p)


g_num = 1; % number of groups exist at the moment
doc2group = containers.Map(doc_ids(1),g_num); % clustering news to groups

if nargin < 3
p = .8; % quntatile percentage for threshold
end
threshold = quantile(min(D,[],2),p);

d = length(D); % number of documents D - square matrix of distances
for i = 2:d
idxs = doc_ids(1:i-1); % looking at already proceeded documents
[v,k] = min(D(i,idxs)); % finding the closest document among previous documents
doc_id = doc_ids(i); 
if v <= threshold % if it is close enough
prev_doc_id = doc_ids(k);
doc2group(doc_id) = doc2group(prev_doc_id); % then assign to the same group
else
  g_num = g_num + 1;
doc2group(doc_id) = g_num; % if not, create new group
end

end

end
