# frozen_string_literal: true

class Buffer
  def initialize(capacity)
    @capacity = capacity
    @items = []
    @monitor = Monitor.new
    @condition = @monitor.new_cond
  end

  def push(item)
    @monitor.synchronize do
      @condition.wait while @items.size >= @capacity
      @items << item
      @condition.signal
    end
  end

  def pop
    @monitor.synchronize do
      @condition.wait while @items.empty?
      item = @items.shift
      @condition.signal
      item
    end
  end
end
