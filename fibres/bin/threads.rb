#!/usr/bin/env ruby
# frozen_string_literal: true

# Create the first thread
thread1 = Thread.new do
  5.times do |i|
    puts "Thread 1: #{i}"
  end
end

# Create the second fiber
thread2 = Thread.new do
  5.times do |i|
    puts "Thread 2: #{i}"
  end
end

# Wait for both threads to finish
thread1.join
thread2.join
