# frozen_string_literal: true

require "spec_helper"
require "counter"
require "benchmark"
require "dummy_service"

RSpec.describe DummyService do
  subject { described_class.new(counter) }

  let(:counter) { instance_double(Counter, :counter) }

  before do
    allow(counter).to receive(:next).and_return(1, 2, 3, 4, 5)
  end

  describe "#call" do
    it "returns the next value from the counter" do
      result = 5.times.map { subject.call }
      expect(result).to eq [1, 2, 3, 4, 5]
    end

    it "sleep for a random delay random delay up to 1 second" do
      bm = Benchmark.measure { 5.times { subject.call } }
      expect(bm.real).to be_between(0.1, 5).exclusive
    end
  end
end
