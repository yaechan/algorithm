# -*- coding: utf-8 -*-

require "spec_helper"

RSpec.describe Array do
  describe "#quick_sort" do
    it "returns sorted array" do
      expect([*1..9].shuffle.quick_sort).to eq [*1..9]
    end
  end
end