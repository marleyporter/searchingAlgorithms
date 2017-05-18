function[numComparisons, currentIndex] = interpolationSearch(V, target)
    
    %Declaration of variables
    low = 1;
    high = length(V);
    numComparisons = 0;

    %loop while low is smaller or equals to high 
    while low <= high
        
        %if low equals to high, indicating 1 element left
        if V(low) == V(high)
            
            %if value is target, set currentIndex to the value and break
            %from loop, if not, send fail token and break
            if (V(low) == target)
                currentIndex = low;
                %+1 comparison
                numComparisons = numComparisons + 1;
                break;
            else
                %+1 comparison
                numComparisons = numComparisons + 1;
                currentIndex = -1;
                break;
            end
        end
        
        %calculate key with array data
        key = ((high - low)/(V(high) - V(low)));
        
        %check the compatability of the array
        if key < 0 || key > 1
            currentIndex = -1;
        end
        
        %calculate mid with key and array data
        mid = floor(low + (key * (target-V(low))));
        
        %if target is lower than mid value, disregard values above mid
        if target < V(mid)
            %+1 comparison
            numComparisons = numComparisons + 1;
            %added to avoid infinte loops
            if (high == mid)
                
                mid = mid - 1;
            end
            
            high = mid;
            
        %if target is larger than mid value, disregard values below mid
        elseif target > V(mid)
            %+1 comparison
            numComparisons = numComparisons + 1;
            %added to avoid infinite loops
            if(low == mid)
                
                mid = mid + 1;
            end
            
            low = mid;
            
        %if target is mid, set currentIndex to mid and break from loop    
        else
            currentIndex = mid;
            %+1 comparison
            numComparisons = numComparisons + 1;
            break; 
        end 
    end
end