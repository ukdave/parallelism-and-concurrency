# frozen_string_literal: true

class Consumer
  def initialize(buffer)
    @buffer = buffer
  end

  def go
    puts "Starting consumer..."
    Thread.new do
      100.times do
        item = @buffer.pop
        puts "Consumed #{item}"
      end
      puts "Finished consuming."
    end
  end
end
