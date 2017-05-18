
%Binary search algorithm

function[numComparisons, currentIndex] = binarySearch(V, target)
    
    %Declaration of variables
    numComparisons = 0;
    low = 1;
    high = length(V);
    currentIndex = 1;
    
    
    for currentIndex = currentIndex: low: high

        %Calculate mid with data
        mid = floor((high+low) / 2);
        
        %if there is one value left in the array not the target, send fail
        %token and break
        if (mid == low && V(mid) ~= target)
            currentIndex = -1;
            numComparisons = numComparisons + 1;
            break;
        end
        
        %if there is one value left in the array not the target, send fail
        %token and break
        if (mid == high && V(mid) ~= target)
            currentIndex = -1;
            numComparisons = numComparisons + 1;
            break;
        end
            
        %if mid is target,+1 comparison break
        if (target == V(mid))
            currentIndex = mid;
            numComparisons = numComparisons + 1;
            break;
            
        %if target is in first half,+1 comparison, discard second half of 
        %array
        elseif (target < V(mid))
            numComparisons = numComparisons + 1;
            high = mid;

        %if target is in second half, +1 comparison, discard first half of
        %array
        elseif (target > V(mid))
            numComparisons = numComparisons + 1;
            low = mid;          
        end
        
    end
    
end