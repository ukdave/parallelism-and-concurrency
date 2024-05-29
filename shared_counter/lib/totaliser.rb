# frozen_string_literal: true

class Totaliser
  def initialize
    @mutex = Thread::Mutex.new
    @total = 0
  end

  def total
    @mutex.synchronize do
      @total
    end
  end

  def add(value)
    @mutex.synchronize do
      @total += value
    end
  end
end
