# frozen_string_literal: true

require "spec_helper"
require "benchmark"
require "app"

RSpec.describe App do
  # rubocop:disable RSpec/MultipleExpectations
  describe "#go" do
    it "returns the correct total in a reasonable time with 10 processes" do
      total = nil
      bm = Benchmark.measure { total = subject.go(threads: 10) }
      expect(total).to eq 5_050
      expect(bm.real).to be_between(0, 15).exclusive
    end

    it "returns the correct total in a reasonable time with 100 processes" do
      total = nil
      bm = Benchmark.measure { total = subject.go(threads: 100) }
      expect(total).to eq 500_500
      expect(bm.real).to be_between(0, 15).exclusive
    end
  end
  # rubocop:enable RSpec/MultipleExpectations
end
