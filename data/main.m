
% fprintf('Reading features... Please, don''t stop the music');
% features = dlmread('features.txt');
% S = sparse(features(:,1),features(:,2),features(:,3));
% 
% fprintf('Building distances... Hammertime\n')
% D = findDist(S);

fprintf('Pheewww, assigning stories...');
doc_ids = dlmread('sorted_time_stamps2.txt');
p = .8;
[doc2group,groups_number] = greedyAggregation(D,doc_ids,p);

fprintf('I got so many stories: %d\n', groups_number);
dlmwrite('stories.txt',doc2group);

fprintf('Now it''s time for Python.\nJust launch this thing already: writeStories.py\n')





