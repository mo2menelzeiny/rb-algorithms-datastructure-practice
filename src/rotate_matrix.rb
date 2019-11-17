# frozen_string_literal: true

# Rotate Matrix: Given an image represented by an NxN matrix, where each pixel in the image is 4
# bytes, write a method to rotate the image by 90 degrees. Can you do this in place?
# @param[Numeric] len
# @param[Array] mtx
def rotate_matrix(len, mtx)
  (0..(len / 2)).each do |layer|
    first = layer
    last = len - 1 - layer
    (first..last - 1).each do |i|
      top = mtx[first][i]
      mtx[first][i] = mtx[last - i][first] # TOP <-- LEFT
      mtx[last - i][first] = mtx[last][last - i] # LEFT <-- BOTTOM
      mtx[last][last - i] = mtx[i][last] # BOTTOM <-- RIGHT
      mtx[i][last] = top
    end
  end
  mtx
end

rotate_matrix(2, [[0, 1], [2, 3]])
rotate_matrix(3, [[0, 1, 2], [3, 4, 5], [6, 7, 8]])
rotate_matrix(4, [[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11], [12, 13, 14, 15]])