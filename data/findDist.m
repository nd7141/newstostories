function D = findDist(S)
    % Finds distances between documents (sparse matrix S)
    
    [d,~] = size(S);
    D = zeros(d,d);
    
    tic 
    for i = 1:d
%         df = bsxfun(@minus,S,S(i,:));
%         dist = sum(df.^2,2);
        df = bsxfun(@times,S,S(i,:));
        nrm = sqrt(sum(S .* S, 2) * (S(i,:) * S(i,:)'));
        dist = 1 - sum(df, 2) ./ nrm;
        D(i,:) = dist;
        fprintf('Proceed %d document: ',i);
        toc
    end
    toc
end