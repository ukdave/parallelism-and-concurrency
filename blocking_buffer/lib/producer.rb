# frozen_string_literal: true

class Producer
  def initialize(buffer)
    @buffer = buffer
  end

  def go
    puts "Starting producer..."
    Thread.new do
      (1..100).each do |item|
        puts "Produced #{item}"
        @buffer.push(item)
      end
      puts "Finished producing."
    end
  end
end
