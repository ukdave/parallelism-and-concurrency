# frozen_string_literal: true

require "spec_helper"
require "totaliser"

RSpec.describe Totaliser do
  describe "#total" do
    it "returns 0 after initialisation" do
      expect(subject.total).to eq 0
    end
  end

  describe "#add" do
    it "adds numbers to the total" do
      subject.add(1)
      subject.add(2)
      expect(subject.total).to eq 3
    end
  end
end
