function ShowEigenFaces(U,datasetName)

figure
for i=1:size(U,2)
    subplot(2,ceil(size(U,2)/2),i)
    if datasetName =="YaleFaces-A"
        current = reshape(U(:,i),243,320);
    elseif datasetName =="CenteredYaleFaces-A"  
        current = reshape(U(:,i),231,195);
    elseif datasetName =="attfaces"  
        current = reshape(U(:,i),112,92);
    
    end
    imshow(current,[])
    title(sprintf("Eigenface %d",i))
    
end
sgtitle("EigenFace (Components) Vectors in decending order")
end
