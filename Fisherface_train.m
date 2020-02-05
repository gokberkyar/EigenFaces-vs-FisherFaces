function [projection,mu,PCA_LDA,d,U]= Fisherface_train(X,y)

classes= unique(y);
num_classes  = size(classes,2);
num_instance = size(X,2);
pca_base_size = num_instance-num_classes;


pca_results =   my_PCA(X,pca_base_size);
mu= pca_results.mu;
D = pca_results.d ;
U = pca_results.U ;


X_PCA = WriteInPCABasis(X,mu,U);


Sb= zeros(pca_base_size,pca_base_size);
Sw= zeros(pca_base_size,pca_base_size);

general_mean = mean(X_PCA,2);

for i=1:size(classes,2)
    idx= find(y==classes(i));
    Number_class = size(idx,2);
    class_mean = mean(X_PCA(:,idx),2);
    class_mean_minus_general_mean = class_mean-general_mean;
    Sb_component = Number_class * class_mean_minus_general_mean * class_mean_minus_general_mean';
    centered_class = X_PCA(:,idx) - class_mean;
    Sw_component = centered_class*centered_class';
    Sb = Sb+ Sb_component;
    Sw = Sw+ Sw_component ;
end

[V,D] = eig(Sb,Sw);
[d,ind] = sort(diag(D),1,'descend');
D = D(ind,ind);
V = V(:,ind);


d = d(1:num_classes-1);
V = V(:,1:num_classes-1);



PCA_LDA = U * V;

projection = PCA_LDA'*X;
end

