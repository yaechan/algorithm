# -*- coding: utf-8 -*-

class Array
  # 配列の前から順に要素を比較し大きい要素を都度後ろに移動していく
  def bubble_sort
    self.each_index.with_object(self) do |index, temp_array|
      # 最高でも（配列の要素数 - 1）回の繰り返しでソートが完了する
      break if index == temp_array.length - 1
      swap_flag = false

      self.each_index do |inner_index|
        # 既に右側に移動済みの数字を比較する必要はない
        break if inner_index >= self.length - index - 1

        # 隣通しの要素を比較して大きい要素を後ろに移動する
        if temp_array[inner_index] > temp_array[inner_index + 1]
          temp_array[inner_index], temp_array[inner_index + 1] = temp_array[inner_index + 1], temp_array[inner_index]
          swap_flag = true
        end
      end

      # 移動が発生しなかったらソート完了
      break unless swap_flag
    end

    return self
  end
end
