function [doc2group,g_num] = greedyAggregation(D,doc_ids,p)

tic

g_num = 1; % number of groups exist at the moment
% doc2group = containers.Map(doc_ids(1),g_num); % clustering news to groups
doc2group = zeros(size(D, 1), 1);
doc2group(1) = g_num;
fprintf('Proceed %d document: ', 1);
toc

if nargin < 3
    p = .2; % quntatile percentage for threshold
end
% threshold = quantile(min(D,[],2),p);
threshold = mean(D(:)) * p;

d = length(D); % number of documents D - square matrix of distances
for i = 2:d
    idxs = doc_ids(1:i-1); % looking at already proceeded documents
    [v,k] = min(D(doc_ids(i),idxs)); % finding the closest document among previous documents
    doc_id = doc_ids(i);
    if v <= threshold % if it is close enough
        prev_doc_id = doc_ids(k);
        doc2group(doc_id) = doc2group(prev_doc_id); % then assign to the same group
    else
        g_num = g_num + 1;
        doc2group(doc_id) = g_num; % if not, create new group
    end
    fprintf('Proceed %d document: ', i);
    toc
end
toc

end
