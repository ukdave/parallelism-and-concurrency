#!/usr/bin/env ruby
# frozen_string_literal: true

# Define the first fiber
fiber1 = Fiber.new do
  5.times do |i|
    puts "Fiber 1: #{i}"
    Fiber.yield
  end
end

# Define the second fiber
fiber2 = Fiber.new do
  5.times do |i|
    puts "Fiber 2: #{i}"
    Fiber.yield
  end
end

# Run the fibers alternately
while fiber1.alive? || fiber2.alive?
  fiber1.resume if fiber1.alive?
  fiber2.resume if fiber2.alive?
end
