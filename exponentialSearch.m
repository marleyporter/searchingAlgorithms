
function [numComparisons, currentIndex] = exponentialSearch(V, target)

    currentIndex = 1;
    numComparisons = 0;

    %while we are in the array and the value is less than the target
    while(currentIndex < length(V) && V(currentIndex) <= target)

        %increase the size of currentIndex
        currentIndex = currentIndex * 2;
    end

    %calculate high and low
    high = min(currentIndex, length(V));
    low = currentIndex/2;

    while(high>low)

        %calculate mid value
        mid = int32((high + low) / 2);

        %if the middle is equal to the target
        if (V(mid) == target)
            
            currentIndex = mid;
            numComparisons = numComparisons + 1;
            break;

        %if the middle is less than the target
        elseif (V(mid) < target)
            
            %added to avoid infinite loops
            if (mid == low)
                mid = mid + 1;
            end
            
            %+1 comparison, discard first half of the array
            numComparisons = numComparisons + 1;
            low = mid;

        elseif(V(mid) > target)
            
            %added to avoid infinte loops
            if (mid == high)
                mid = mid - 1;
            end
            
            %+1 comparison, descard second half of the array
            numComparisons = numComparisons + 1;
            high = mid;
        end
        
    end
end
