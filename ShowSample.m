function ShowSample(Projection,U,datasetName)


y = datasample(Projection,6,2) 

images = U*y;
figure
for i=1:size(images,2)
    subplot(2,ceil(size(images,2)/2),i)
    if datasetName =="YaleFaces-A"
        current = reshape(images(:,i),243,320);
    elseif datasetName =="CenteredYaleFaces-A"  
        current = reshape(images(:,i),231,195);
    elseif datasetName =="attfaces"  
        current = reshape(images(:,i),112,92);
    end
    imshow(current,[])
    title(sprintf("Individual %d",i))
    
end
sgtitle("Random individuals applied PCA after mean subtraction")
end