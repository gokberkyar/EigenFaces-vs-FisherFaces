function [projection,mu,U,D] = EigenFaceWithout_Train(X,y,componentCount)
    pca_results =   my_PCA(X,componentCount+3);
    
    D = pca_results.d;
    U = pca_results.U;
   
    mu = pca_results.mu;
    
    D = D(4:end);
    U = U(:,4:end);
    
    projection = WriteInPCABasis(X,mu,U);
end

