# @param [Array] arr
# @param [Numeric] item
# @return [Object]
def binary_search(arr, item)
  high = arr.length - 1, low = 0
  while low <= high
    mid = ((high + low) / 2).round
    return mid if arr[mid] == item

    if item < arr[mid]
      high = mid - 1
    else
      low = mid + 1
    end
  end
  nil
end

puts binary_search([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 4)
puts binary_search([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 8)
