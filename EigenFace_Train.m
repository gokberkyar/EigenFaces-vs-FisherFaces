function [projection,mu,U,D] = EigenFace_Train(X,y,componentCount)
    pca_results =   my_PCA(X,componentCount);
    D = pca_results.d;
    U = pca_results.U;
    mu = pca_results.mu;
    projection = WriteInPCABasis(X,mu,U);
end

