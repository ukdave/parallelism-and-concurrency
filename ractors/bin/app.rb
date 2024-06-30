#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/counter"

counter = Counter.new

5.times.map do
  Thread.new do
    5.times do
      counter.increment
    end
  end
end.each(&:join)

puts counter.value
