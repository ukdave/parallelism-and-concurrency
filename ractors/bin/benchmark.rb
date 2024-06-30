#!/usr/bin/env ruby
# frozen_string_literal: true

def tarai(x, y, z)
  return y if x <= y

  tarai(tarai(x - 1, y, z),
        tarai(y - 1, z, x),
        tarai(z - 1, x, y))
end

require "benchmark"

Benchmark.bm do |x|
  # sequential version
  x.report("seq") { 4.times { tarai(14, 7, 0) } }

  # thread version
  x.report("threads") do
    4.times.map do
      Thread.new { tarai(14, 7, 0) }
    end.each(&:join)
  end

  # ractor version
  x.report("ractors") do
    4.times.map do
      Ractor.new { tarai(14, 7, 0) }
    end.each(&:take)
  end
end
