require 'byebug'
def bubble_sort(arr, &prc)
    prc ||= Proc.new { |x,y| x <=> y }
    return arr if arr.length <= 1

    sorted = false 
    while !sorted
        sorted = true
        i=0
        while i < arr.length-1
            if( prc.call(arr[i], arr[i+1]) > 0)
                arr[i], arr[i+1] = arr[i+1], arr[i]
                sorted = false
            end
            i += 1
        end
    end
    arr
end

# res = bubble_sort([4,1,2,6,3,5,5,7,8,8,8,8,5])
# p res

def optimized_bubble_sort(arr)
    prc ||= Proc.new { |x,y| x <=> y }
    lastSwap = arr.length-1;
    i = 0
    while i < arr.length
        is_sorted = true;
        currentSwap = -1;
        j = 0
        while j < lastSwap
            if prc.call(arr[j],arr[j+1]) > 0 
                arr[j], arr[j+1] = arr[j+1], arr[j]
                is_sorted = false;
                currentSwap = j;
            end
            j+=1
        end
        return arr if is_sorted
        lastSwap = currentSwap;
        i+=1
    end
    arr
end

# res = optimized_bubble_sort([4,1,2,6,3,5,5,7,8,8,8,8,5])
# p res

def merge(left, right)
    prc ||= Proc.new {|x,y| x <=> y}
    result = []
    until left.empty? || right.empty?
        if prc.call(left[0],right[0]) == -1
            result << left.shift
        elsif prc.call(left[0], right[0]) == 1
            result << right.shift
        else 
            result << left.shift
        end
    end
    result + left + right
end

def merge_sort(arr)
    return arr if arr.length <= 1

    mid = arr.length/2
    left = arr[0...mid]
    right = arr[mid..-1]

    merge(merge_sort(left), merge_sort(right))
end



# p merge_sort([2,1,3,57,57,3,2])

def og_quick_sort(arr)
    prc ||= Proc.new {|x,y| x <=> y}
    return arr if arr.length <= 1
    
    pivot = arr.first
    left = arr[1..-1].select { |el| prc.call(pivot, el) == 1 }
    right = arr[1..-1].select { |el| prc.call(pivot, el) != 1 }

    og_quick_sort(left) + [pivot] + og_quick_sort(right)
end

# p og_quick_sort([2,1,3,57,57,3,2,0,-1])

#  [ 4 , 1 , 3 , 5 , 6 , 3 , 2 , 0 , -1 ]
#      [-1, 1, 3, 3, 2, 0, 4, 5, 6]
#                           * =

# def in_place_quick_sort(arr, s_idx = 0, length = arr.length)
#     prc ||= Proc.new { |x,y| x <=> y }
#     return arr if arr.length <= 1

#     boundary_idx = partition(arr, s_idx, length)


#     leftlen = boundary_idx - s_idx
#     rightlen = length - (boundary_idx + 1)

#     in_place_quick_sort( arr, s_idx, leftlen )

#     in_place_quick_sort( arr, boundary_idx + 1, rightlen )
#     arr
# end


# def partition(arr, s_idx, length)
#     prc ||= Proc.new { |i, j| i <=> j }
    
#     boundary_idx = s_idx
#     pivot = arr[s_idx]
#     i = s_idx + 1
#     while i < s_idx + length
#         # debugger
#         if arr[i] >= pivot
#             i += 1
#         else
#             arr[boundary_idx + 1], arr[i] = arr[i], arr[boundary_idx + 1]
#             boundary_idx += 1
#             i += 1
#         end
#     end
#     arr[boundary_idx], arr[s_idx] = arr[s_idx], arr[boundary_idx]
#     boundary_idx
# end


 def in_place_quick_sort(array, start = 0, length = array.length)
    return array if length < 2

    pivot_idx = partition(array, start, length)

    leftlen = pivot_idx - start
    rightlen = length - (leftlen + 1)
    in_place_quick_sort(array, start, leftlen)
    in_place_quick_sort(array, pivot_idx + 1, rightlen)

    array
  end

  def partition(array, start, length)
    pivot_idx = start
    pivot = array[start]
    i = start + 1
    while i < start + length
        # debugger
        if array[i] >= pivot
            i += 1
        else
            array[pivot_idx + 1], array[i] = array[i], array[pivot_idx + 1]
            pivot_idx += 1
            i += 1
        end
    end
    array[start], array[pivot_idx] = array[pivot_idx], array[start]

    pivot_idx
  end


 p in_place_quick_sort([4 , 1 , 3 , 2 , 5 , 6 , 3 , 7 , 0 , -1])
