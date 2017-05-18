
function[numComparisons, currentIndex] = ternarySearch(V, target)

    %Declaration of variables
    numComparisons = 0;
    low = 1;
    top = length(V);
    currentIndex = 1;
    
    
    for currentIndex = currentIndex: low : top
        
        %Divide the array in to thirds saving the 2 dividing points
        mid1 = floor(low + (top - low) / 3);
        mid2 = floor(low + 2*(top - low) / 3);
        
        %if there is 1 value left, not the target, send fail token (-1) and
        %break
        if(mid1 == mid2 == top == low && V(mid1) ~= target)
            currentIndex = -1;
            break;
        end
        
        %If the target is the first dividing point, break from the loop
        if (V(mid1) == target)
            currentIndex = mid1;
            numComparisons = numComparisons + 1;
            break;
        
        %If the target is the second dividing point, break from the loop
        elseif (V(mid2) == target)
            currentIndex = mid2;
            numComparisons = numComparisons + 1;
            break;
            
        %If the target is located in the first third of the array, set the
        %top to the first dividing point
        elseif (target < V(mid1))
            numComparisons = numComparisons + 1;
            top = mid1 - 1;
            
        %If the target is located in the last third of the array, set the
        %low to the second dividing point
        elseif (target > V(mid2))
            numComparisons = numComparisons + 1;
            low = mid2 + 1;
            
        %If the target is located in the second third of the array, set the
        %low to the first dividing point and the top to the second dividing
        %point
        else
            numComparisons = numComparisons + 1;
            low = mid1;
            top = mid2;
        end
        
    end

end