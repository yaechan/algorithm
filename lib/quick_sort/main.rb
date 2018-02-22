# -*- coding: utf-8 -*-

class Array
  def swap!(a, b)
    raise ArgumentError unless a.between?(0, self.size - 1) && b.between?(0, self.size - 1)

    self[a], self[b] = self[b], self[a]

    self
  end

  # #swap!に依存
  def swap(a, b)
    self.dup.swap!(a, b)
  end

  # #swap!に依存
  def quick_sort
    flags = self.product([false])

    while left_element = flags.rassoc(false)
      left_index    = flags.index(left_element)
      right_element = flags.drop(left_index).rassoc(true)
      pivot_index   = (right_element ? flags.index(right_element) : flags.size) - 1
      right_index   = pivot_index - 1

      if left_index == pivot_index
        flags[pivot_index][1] = true
        next
      end

      # 左マーカーが右マーカーより左にある限り繰り返す
      while left_index <= right_index
        left_index += 1 while flags[left_index][0] < flags[pivot_index][0]

        break if left_index >= right_index

        right_index -= 1 while flags[right_index][0] >= flags[pivot_index][0] && right_index > left_index

        break if left_index >= right_index

        flags.swap!(left_index, right_index)
      end

      case left_index
      when pivot_index
        flags[pivot_index][1] = true
      when right_index
        flags.swap!(left_index, pivot_index)
        flags[left_index][1] = true
      end
    end

    flags.transpose[0]
  end
end