function pca_results =   my_PCA(X,componentCount)
 
mu= mean(X,2);

pca_results.mu = mu;
X = X - mu;

[V,D] = eig(X'*X);

V = X*V;


 for i=1:size(V,2)
     V(:,i) = V(:,i)./norm(V(:,i));
 end



[d,ind] = sort(diag(D),'descend');
D = D(ind,ind);
V = V(:,ind);

d = d(1:componentCount);
V = V(:,1:componentCount);

pca_results.d = d;
pca_results.U = V;
