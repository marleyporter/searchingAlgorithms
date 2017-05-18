function[numComparisons, currentIndex] = fibonacciSearch(V, target)

    %declaration of variables
    fibMMm2 = 0;
    fibMMm1 = 1;
    fibM = fibMMm2 + fibMMm1;
    numComparisons = 0;
    currentIndex = 1;
    
    %calculate smallest fibonacci number largerthan the length of the
    %array
    while (fibM < length(V))
        fibMMm2 = fibMMm1;
        fibMMm1 = fibM;
        fibM = fibMMm2 + fibMMm1;
    end
    
    offset = 1;
    
    %while there are elements to be inspected
    while (fibM > 1)
        %calculate the 
        currentIndex = min(offset+fibMMm2, length(V));
        
        %if target is larger than currentIndex value, reassign fibonacci
        %variables and cut values from offset to currentIndex
        if (V(currentIndex) < target)
            numComparisons = numComparisons + 1;
            fibM  = fibMMm1;
            fibMMm1 = fibMMm2;
            fibMMm2 = fibM - fibMMm1;
            offset = currentIndex;
            
        %if target is smaller than currentIndex value, reassign fibonacci
        %variables and cut values greater than currenIndex
        elseif (V(currentIndex) > target)
            numComparisons = numComparisons + 1;
            fibM  = fibMMm2;
            fibMMm1 = fibMMm1 - fibMMm2;
            fibMMm2 = fibM - fibMMm1;
            
        %if target is not located in the array, break from loop
        else
            numComparisons = numComparisons + 1;
            break;
        end
    end
    
    %if the last value is the target, return the index, if not, return fail
    %token
    if (fibMMm1 && V(offset) == target)
        numComparisons = numComparisons + 1;
        currentIndex = V(offset);
    else
        currentIndex = -1;
    end

end