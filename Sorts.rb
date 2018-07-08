
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

res = bubble_sort([4,1,2,6,3,5,5,7,8,8,8,8,5])
p res