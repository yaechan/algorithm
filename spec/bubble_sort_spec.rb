# -*- coding: utf-8 -*-

require "spec_helper"

RSpec.describe "BubbleSort" do
  it "Array#bubble_sort returns sorted array" do
    expect([*1..9].shuffle.bubble_sort).to eq [*1..9]
  end
end