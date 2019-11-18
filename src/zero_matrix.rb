# frozen_string_literal: true

# @param[Array] mtx
# @param[Numeric] r_size
# @param[Numeric] c_size
def zero_matrix(mtx, r_size, c_size)
  f_col_has_zero = false
  f_row_has_zero = false
  (0..r_size - 1).each { |i| f_col_has_zero = true if mtx[i][0].equal? 0 }
  (0..c_size - 1).each { |i| f_row_has_zero = true if mtx[0][i].equal? 0 }
  mark_zeros(mtx, r_size, c_size)
  set_zeros(mtx, r_size, c_size)
  (0..r_size - 1).each { |i| mtx[i][0] = 0 } if f_row_has_zero
  (0..c_size - 1).each { |i| mtx[0][i] = 0 } if f_col_has_zero
  mtx
end

# @param[Array] mtx
# @param[Numeric] r_size
# @param[Numeric] c_size
def mark_zeros(mtx, r_size, c_size)
  (1..r_size - 1).each do |i|
    (1..c_size - 1).each do |j|
      if mtx[i][j].equal? 0
        mtx[i][0] = 0
        mtx[0][j] = 0
      end
    end
  end
  mtx
end

# @param[Array] mtx
# @param[Numeric] r_size
# @param[Numeric] c_size
def set_zeros(mtx, r_size, c_size)
  (1..r_size - 1).each do |i|
    (1..c_size - 1).each { |j| mtx[i][j] = 0 } if mtx[i][0].equal? 0
  end
  (1..c_size - 1).each do |i|
    (1..r_size - 1).each { |j| mtx[j][i] = 0 } if mtx[0][i].equal? 0
  end
  mtx
end

zero_matrix([[1, 2, 3], [4, 0, 6], [7, 8, 9], [10, 11, 12]], 4, 3)
zero_matrix([[0, 2, 3], [4, 0, 6], [7, 8, 9], [10, 11, 12]], 4, 3)