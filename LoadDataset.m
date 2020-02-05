function [X,y,datasetName] = LoadDataset(datasetName)
if nargin <1
    datasetName = "CenteredYaleFaces-A";
end
if datasetName == "YaleFaces-A"
    numClasses = 15;
    numInstance = 11;
    InstanceTypes  = ["centerlight","glasses","happy", ...
        "leftlight","noglasses","normal","rightlight", ...
        "sad","sleepy","surprised","wink"];
    X = [];
    y = [];
    for i= 1:numClasses
        for j=1:numInstance
            %creating image name
            currentImageName = sprintf("yalefaces/subject%02.f.%s",i,InstanceTypes(j));
            %reading the image
            currentImage = imread(currentImageName);
            %flatenning the image and cover to double.
            currentImage= double(currentImage(:));
            %stackingImages as [ x1 , x2 , x3 ... xN]
            X =[X , currentImage];
            %creating labels for images [c1,c2 ... ] for each N image c can
            %vary as numberClasses
            y =[y;i];
        end
    end
elseif datasetName == "CenteredYaleFaces-A";
    numClasses = 15;
    numInstance = 11;
    InstanceTypes  = ["centerlight","glasses","happy", ...
        "leftlight","noglasses","normal","rightlight", ...
        "sad","sleepy","surprised","wink"];
    X = [];
    y = [];
    for i= 1:numClasses
        for j=1:numInstance
            %creating image name
            currentImageName = sprintf("centered/subject%02.f.%s.pgm",i,InstanceTypes(j));
            %reading the image
            currentImage = imread(currentImageName);
            %flatenning the image and cover to double.
            currentImage= double(currentImage(:));
            %stackingImages as [ x1 , x2 , x3 ... xN]
            X =[X , currentImage];
            %creating labels for images [c1,c2 ... ] for each N image c can
            %vary as numberClasses
            y =[y,i];
        end
    end
elseif datasetName == "attfaces";
    numClasses = 40;
    numInstance = 10;
    InstanceTypes  = 1:10;
    X = [];
    y = [];
    for i= 1:numClasses
        for j=1:numInstance
            %creating image name
            currentImageName = sprintf("attfaces/s%d_%d.pgm",i,InstanceTypes(j));
            %reading the image
            currentImage = imread(currentImageName);
            %flatenning the image and cover to double.
            currentImage= double(currentImage(:));
            %stackingImages as [ x1 , x2 , x3 ... xN]
            X =[X , currentImage];
            %creating labels for images [c1,c2 ... ] for each N image c can
            %vary as numberClasses
            y =[y,i];
        end
    end    

end 
end