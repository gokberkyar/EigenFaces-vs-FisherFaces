function projection = WriteInPCABasis(X,mu,U)
X= X- mu;
projection = U' * X ;
end

