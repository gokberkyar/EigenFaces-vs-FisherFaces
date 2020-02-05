function [CorrectlyLabeled,missLabeled,ERRORPERCENT]=CrossValidation(X,y,modelName,distanceModel,k,threshold,componentCount)

if modelName == "Eigen1"
    numInstance = size(X,2);
    missLabeled=0;
    CorrectlyLabeled=0;
    for i=1:numInstance
        %tic
        [X_train,y_train,X_test,y_test] = Train_Test_Split(X,y,i);  
        [X_train_projected,mu,U,D]=EigenFace_Train(X_train,y_train,componentCount);
        [predictClass,Correctly_Classified] = EigenFace_Test(X_test,y_test,X_train_projected,y_train,mu,U,D,distanceModel,k,threshold);
        if (~(predictClass ==-1) && Correctly_Classified)
            CorrectlyLabeled=CorrectlyLabeled+1;
        else
            missLabeled=missLabeled+1;
        end
        %toc
    end
    
elseif modelName == "FisherFace"
    numInstance = size(X,2);
    missLabeled=0;
    CorrectlyLabeled=0;
    for i=1:numInstance
       % tic
        [X_train,y_train,X_test,y_test] = Train_Test_Split(X,y,i);
         [X_train_projected,mu,PCA_LDA,D] = Fisherface_train(X_train,y_train);
%         model = fisherfaces(X_train, y_train);
%         X_train_projected=model.P;
%         PCA_LDA=model.W;
%         mu=model.mu;
%         D= model.D;
         mu = zeros(size(mu));
        [predictClass,Correctly_Classified] = Fisherface_test(X_test,y_test,X_train_projected,y_train,mu,PCA_LDA,D,distanceModel,k,threshold);
        if (~(predictClass ==-1) && Correctly_Classified)
            CorrectlyLabeled=CorrectlyLabeled+1;
        else
            missLabeled=missLabeled+1;
        end
       % toc;
    end
    
elseif modelName == "EigenWO3"
    
    numInstance = size(X,2);
    missLabeled=0;
    CorrectlyLabeled=0;
    for i=1:numInstance
       % tic
        [X_train,y_train,X_test,y_test] = Train_Test_Split(X,y,i);  
        [X_train_projected,mu,U,D]=EigenFaceWithout_Train(X_train,y_train,componentCount);
        [predictClass,Correctly_Classified] = EigenFaceWithout_Test(X_test,y_test,X_train_projected,y_train,mu,U,D,distanceModel,k,threshold);
        if (~(predictClass ==-1) && Correctly_Classified)
            CorrectlyLabeled=CorrectlyLabeled+1;
        else
            missLabeled=missLabeled+1;
        end
        %toc
    end
    
    
    
    
end


ERRORPERCENT = 100*missLabeled/(missLabeled+CorrectlyLabeled);
end

