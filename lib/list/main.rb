# -*- coding: utf-8 -*-

class List
  attr_accessor :value, :post

  def initialize *args
    @value = nil
    @post  = nil

    # 以下はList#pushに依存
    unless args.empty?
      pre = self
      until args.empty?
        pre.push(args.shift)
        pre = pre.post
      end
    end
  end

  def == right
    if right.class == List &&
       self.length == right.length
      pre_count = 0
      self.each do |pre_value|
        post_count = 0
        right.each do |post_value|
          if pre_count == post_count
            pre_value == post_value ? break : (return false)
          else
            post_count += 1
          end
        end
        post_count == right.length ? (return false) : pre_count += 1
      end

      return true
    end

    return false
  end

  # List#each, List#lengthに依存
  def [] index
    if self.length > index
      count = 0
      self.each do |element|
        return element if count == index
        count += 1
      end
    else
      nil
    end
  end

  def []= index, new_value
    pre = self

    (index + 1).times do
      pre.post ||= List.new
      pre = pre.post
    end

    pre.value = new_value
  end

  # List#eachに依存
  def to_s
    string = "["
    self.each do |pre|
      pre = "\"#{pre}\"" if pre.class == String
      pre = "nil" if pre.nil?
      string << "#{pre}, "
    end

    return string.gsub(/\,\s$/, "]")
  end

  def length
    pre   = self
    index = 0
    index += 1 while pre = pre.post

    return index
  end

  # List#lengthに依存
  def each
    if block_given?
      pre = self.post
      self.length.times do
        yield pre.value
        pre = pre.post
      end
    end

    return self
  end

  def push(element)
    pre = self
    pre = pre.post until pre.post.nil?
    pre.post = List.new
    pre.post.value = element

    return self
  end

  # List#delete_atに依存
  def pop
    last_index = self.length - 1
    self.delete_at(last_index)
  end

  def insert(index, new_value)
    pre = self

    index.times do
      pre.post ||= List.new
      pre = pre.post
    end

    new_element       = List.new
    new_element.value = new_value
    new_element.post  = pre.post
    pre.post          = new_element

    self
  end

  # List#lengthに依存
  def delete(value)
    before_size = self.length
    pre = self

    while pre
      post = pre.post

      if !post.nil? && post.value == value
        pre.post = post.post
      else
        pre = pre.post
      end
    end

    before_size == self.length ? nil : value
  end

  # List#lengthに依存
  def delete_at(index)
    return nil if self.length <= index

    pre = self

    (index + 1).times do |n|
      if index == n
        post = pre.post
        pre.post = post.post

        return post.value
      else
        pre = pre.post
      end
    end
  end
end