function [predictClass,Correctly_Classified] = EigenFace_Test(X_test,y_test,X_train_projected,y_train,mu,U,D,distanceModel,k,threshold)
    X_test=WriteInPCABasis(X_test,mu,U);
    
   [predictClass,Error] = KNN(X_train_projected,X_test,k,distanceModel,D,y_train);
%       predictClass = knn2(X_train_projected, y_train, X_test,  k);
    
    if Error > threshold
        predictClass=-1;
        Correctly_Classified = false;
        display("Error is more than threshold")
    else
        if predictClass == y_test
            Correctly_Classified = true;
        else
            Correctly_Classified = false;
        end
    end
        
        

end

