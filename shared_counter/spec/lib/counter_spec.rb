# frozen_string_literal: true

require "spec_helper"
require "counter"

RSpec.describe Counter do
  describe "#next" do
    it "returns the next value" do
      results = 5.times.map { subject.next }
      expect(results).to eq [1, 2, 3, 4, 5]
    end
  end
end
