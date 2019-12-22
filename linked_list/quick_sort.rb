# @param[Array] arr
# @param[Numeric] low
# @param[Numeric] high
def quick_sort(arr, low, high)
  return if low >= high

  pi = partition(arr, low, high)
  quick_sort(arr, low, pi - 1)
  quick_sort(arr, pi + 1, high)
end

# @param[Array] arr
# @param[Numeric] low
# @param[Numeric] high
def partition(arr, low, high)
  pivot = arr[high]
  i = low - 1
  (low..(high - 1)).each do |j|
    if arr[j] < pivot
      i += 1
      arr[j], arr[i] = arr[i], arr[j] # swap element
    end
  end
  arr[i + 1], arr[high] = arr[high], arr[i + 1] # swap pivot
  i + 1
end

arr = [8, 3, 4, 5, 9, 1]
quick_sort(arr, 0, 5)

