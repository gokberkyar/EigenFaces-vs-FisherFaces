function [X_train,y_train,X_test,y_test] = Train_Test_Split(X,y,testIndex)
X_test=X(:,testIndex);
y_test=y(testIndex);
X(:,testIndex) = [];
y(testIndex) = [];

X_train = X;
y_train = y;


end



