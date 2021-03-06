# -*- coding: utf-8 -*-

require "spec_helper"

RSpec.describe List do
  let(:list) { List.new(1, 9, 8, 4) }

  describe "#==" do
    context "when argument is same as receiver" do
      it "returns 'true'" do
        expect(list == list).to be_truthy
      end
    end

    context "when argument is different from receiver" do
      it "returns 'false'" do
        expect(list == [1, 9, 8, 4]).to be_falsey
      end
    end
  end

  describe "#[]" do
    it "returns element's value designated as argument" do
      expect(list[0]).to eq 1
    end
  end

  describe "#[]=" do
    it "replace element designated as first argument with second argument" do
      list[2] = 0
      expect(list).to eq List.new(1, 9, 0, 4)
    end
  end

  describe "#each" do
    it { expect { |b| list.each(&b) }.to yield_control.exactly(list.length) }
    it { expect { |b| list.each(&b) }.to yield_successive_args(1, 9, 8, 4) }
  end

  describe "#to_s" do
    it "returns string that presents data like array" do
      expect(list.to_s).to eq "[1, 9, 8, 4]"
    end
  end

  describe "#length" do
    it "returns number of elements" do
      expect(list.length).to eq 4
    end
  end

  describe "#push" do
    it "returns a list added argument to the end of the receiver" do
      expect(list.push("年")).to eq List.new(1, 9, 8, 4, "年")
    end

    it "adds a argument to the end of the receiver" do
      list.push("年")
      expect(list).to eq List.new(1, 9, 8, 4, "年")
    end
  end

  describe "#pop" do
    it "returns a last element of the receiver" do
      expect(list.pop).to eq 4
    end

    it "deletes a element that the end of the receiver" do
      list.pop
      expect(list).to eq List.new(1, 9, 8)
    end
  end

  describe "#insert" do
    it "returns list added arguments" do
      expect(list.insert(0, "AC")).to eq List.new("AC", 1, 9, 8, 4)
    end
  end

  describe "#delete" do
    it "returns a last element deleted" do
      expect(list.delete(9)).to eq 9
    end

    it "deletes a element from receiver" do
      list.delete(9)
      expect(list).to eq List.new(1, 8, 4)
    end
  end

  describe "#delete_at" do
    it "returns a element deleted" do
      expect(list.delete_at(1)).to eq 9
    end

    it "deletes a element from receiver" do
      list.delete_at(1)
      expect(list).to eq List.new(1, 8, 4)
    end
  end
end