function [predictClass,Error] = KNN(data,guess,k,distanceModel,D,y)

%data at each [p1 p2  .. pN] for each training sample PCA components
%guess single new observation in the same format
%distanceModel is euclidean or mahalonobis distance
%k is number of closest neigbours
%tie breaking strategy is by default nearest (1-NN)
%task is to find minimum distance points in the training set





%ind index of smallest k distances 

%idx index of near neighbours which has the maximum count in unique count
%format

%indexes index of near neighbours which belong to predicted class




if distanceModel == "Mahalonobis"
    distances  = (data-guess).^2;
    %TO avoid numeric errors
    D(D==inf)  = max(D(isfinite(D)));
    
    distances = distances./D;
    distances=sum(distances,1);
    
elseif distanceModel == "Euclidean"
    distances  = (data-guess).^2;
    distances=sum(distances,1);
end

[values,ind] = sort(distances);
nearNeigbours = y(ind);

nearNeigbours=nearNeigbours(1:k);
B = unique(nearNeigbours);
out = [B,histc(nearNeigbours,B)];

maxval = max(out(:,2));
idx = find(out(:,2) == maxval);
guesses = out(idx,1);
currentGuess = guesses(1);

if size(guesses,1) > 2
    currentmin   = find(nearNeigbours==guesses(1),1);
    currentGuess =guesses(1);
    for i=2:size(guesses,1)
        if find(nearNeigbours==guesses(i),1) < currentmin
            currentmin =find(nearNeigbours==guesses(i),1);
            currentGuess=guesses(i);
        end
    end
else
    currentGuess = guesses(1);
end

predictClass= currentGuess;
indexes = find(nearNeigbours==predictClass);
Error = mean(values(indexes));

end