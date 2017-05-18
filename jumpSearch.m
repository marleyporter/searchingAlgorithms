
function[numComparisons,  currentIndex] = jumpSearch(V, target)
    
    %Declaration of variables
    numComparisons = 0;
    jump = int32((sqrt(length(V))));
    currentIndex = int32(1);
    prev = 1;
    
    %Loop with jump increments
    for currentIndex = currentIndex: jump: length(V)
        
        %If index value is target, +1 comparison and exit loop
        if (V(currentIndex) == target)
            numComparisons = numComparisons + 1;
            break;
        %If index value is larger than target, +1 comparison
        elseif (V(currentIndex) > target)
            numComparisons = numComparisons + 1;
            
            %linear search from previous index value to current index value
            for prev = prev: 1: currentIndex
                %if index value is target, +1 comparison and exit loops
                if (V(prev) == target)
                    numComparisons = numComparisons + 1;
                    currentIndex = prev;
                    break;
                %+1 comparison
                else
                    numComparisons = numComparisons + 1;
                    
                end
            end
         
            break;
        else
        numComparisons = numComparisons + 1;    
        end
        %set previous to the current index
        prev = currentIndex + 1;
    end
    
end