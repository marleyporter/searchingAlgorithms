function[numComparisons, currentIndex] = randomSearch(V, target, L)
    
    numComparisons = 0;
    %Set currentIndex to a random number between 1 and the length of
    %the array
    currentIndex = randi([1, length(V)],1,1);
    
    %First comparison with currentIndex = 1
    numComparisons = numComparisons +1;
    
    %Do the following until the value in the array found at the
    %currentIndex is equal to the target.
    while V(currentIndex) ~= target
        
        %Set currentIndex to a random number between 1 and the length of
        %the array
        currentIndex = randi([1, length(V)],1,1);
        
        %If the value found in the array at the currentIndex matches the
        %target break from the while loop
        if V(currentIndex) == target
            numComparisons = numComparisons + 1;
            break;
        end
        
        %Add to the number of comparisons each time it cycles through the
        %loop
        numComparisons = numComparisons + 1;
    end
end