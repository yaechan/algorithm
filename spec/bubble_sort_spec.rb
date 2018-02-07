# -*- coding: utf-8 -*-

require "spec_helper"

RSpec.describe Array do
  describe "#bubble_sort" do
    it "returns sorted array" do
      expect([*1..9].shuffle.bubble_sort).to eq [*1..9]
    end
  end
end