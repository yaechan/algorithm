# -*- coding: utf-8 -*-

require "spec_helper"

RSpec.describe Array do
  let(:array) { [0, 1, 2, 3] }

  describe "#quick_sort" do
    it "returns sorted array" do
      expect([*1..9].shuffle.quick_sort).to eq [*1..9]
    end
  end

  describe "#swap" do
    it "returns swapped array" do
      expect(array.swap(0, 2)).to eq [2, 1, 0, 3]
    end

    it "doesn't change self" do
      array.swap(0, 2)
      expect(array).to eq [0, 1, 2, 3]
    end
  end

  describe "#swap!" do
    it "returns swapped array" do
      expect(array.swap!(0, 2)).to eq [2, 1, 0, 3]
    end

    it "changes self" do
      array.swap!(0, 2)
      expect(array).to eq [2, 1, 0, 3]
    end
  end
end