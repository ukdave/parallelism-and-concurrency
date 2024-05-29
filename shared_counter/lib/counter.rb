# frozen_string_literal: true

class Counter
  def initialize
    @mutex = Thread::Mutex.new
    @counter = 0
  end

  def next
    @mutex.synchronize do
      @counter += 1
    end
  end
end
