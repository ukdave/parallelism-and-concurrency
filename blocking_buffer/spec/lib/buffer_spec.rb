# frozen_string_literal: true

require "buffer"

RSpec.describe Buffer do
  subject { described_class.new(capacity) }

  let(:capacity) { 10 }

  it "behaves like first in first out (FIFO) buffer" do
    subject.push(:foo)
    subject.push(:bar)
    expect(subject.pop).to eq :foo
    expect(subject.pop).to eq :bar
  end

  describe "#pop" do
    context "when the buffer is empty" do
      it "blocks until an item is pushed" do
        pop_called = false

        pop_thread = Thread.new do
          subject.pop
          pop_called = true
        end

        sleep 0.1 # Allow some time for the thread to potentially block
        expect(pop_called).to be false

        subject.push(:foo)
        sleep 0.1 # Allow some time for the thread to unblock

        expect(pop_called).to be true
        pop_thread.join
      end
    end
  end

  describe "#push" do
    context "when the buffer is full" do
      before do
        capacity.times { subject.push(:foo) }
      end

      it "blocks until an item is popped" do
        push_called = false

        push_thread = Thread.new do
          subject.push(:bar)
          push_called = true
        end

        sleep 0.1 # Allow some time for the thread to potentially block
        expect(push_called).to be false

        subject.pop
        sleep 0.1 # Allow some time for the thread to unblock

        expect(push_called).to be true
        push_thread.join
      end
    end
  end
end
