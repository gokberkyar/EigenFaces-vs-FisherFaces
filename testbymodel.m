clear all
clc
[X,y,datasetName] = LoadDataset("attfaces");

models=["Eigen1","EigenWO3","FisherFace"];
distanceModels = ["Euclidean","Mahalonobis"];
kvalues =[1,5 ];
componentCounts = [10 , 30];


for i_loop = 1:size(models,2)
    counter =1;
    counters=[];
    modelnames=[];
    figure 
    model=models(i_loop);
    for j_loop =1:size(distanceModels,2)
        distmodel=distanceModels(j_loop);
        for k_loop = 1:size(kvalues,2)
            k=kvalues(k_loop);
            for m_loop = 1:size(componentCounts,2)
                nComp=componentCounts(m_loop);
                if distmodel == "Euclidean"
                    distmodelshort="Euc.";
                else
                    distmodelshort="Mah.";
                end
                if model=="Eigen1"
                    modelshort="Eig";
                elseif model==  "EigenWO3"
                    modelshort="Eig-3";
                else
                    modelshort="Fisher";
                end
                modelname = sprintf("%s %s k=%d nComp. %d",modelshort,distmodelshort,k,nComp);
                [CorrectlyLabeled,missLabeled,ERRORPERCENT]=CrossValidation(X,y,models(i_loop),distanceModels(j_loop),kvalues(k_loop),1000000000000000000000,componentCounts(m_loop))
      
                bar(counter,ERRORPERCENT)
                hold on
                counters = [counters counter];
                modelnames=[modelnames modelname];
                xticks(counters)
                xticklabels(modelnames)
                xtickangle(70)
                
                text(counter,ERRORPERCENT,num2str(ERRORPERCENT),'vert','bottom','horiz','center'); 
                box off
                
                counter =counter +1;
                title( sprintf("%s model with different parameters",model))
                xlabel("Models")
                ylabel("Percent Error")
                drawnow;
            end
        end
    end
end

