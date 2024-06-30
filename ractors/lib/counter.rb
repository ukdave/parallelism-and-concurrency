# frozen_string_literal: true

class Counter
  def initialize
    @mutex = Mutex.new
    @ractor = Ractor.new do
      counter = 0
      loop do
        Ractor.yield case Ractor.receive
                     when :increment then counter += 1
                     when :decrement then counter -= 1
                     when :reset then counter = 0
                     when :value then counter
                     when :exit then break
                     end
      end
    end
  end

  def increment
    send_and_take(:increment)
  end

  def decrement
    send_and_take(:decrement)
  end

  def value
    send_and_take(:value)
  end

  def reset
    send_and_take(:reset)
  end

  def exit
    send_and_take(:exit)
  end

  private

  # Need to use a mutex here to synchronize access otherwise you may get deadlock when calling from multiple threads.
  # Multiple threads calling @ractor.take can interfere with each other because they all wait on the same Ractor and
  # expect a response. When the Ractor processes a message and yields a response, only one waiting @ractor.take call
  # is satisfied, and others continue to wait indefinitely.
  def send_and_take(message)
    @mutex.synchronize do
      @ractor.send(message)
      @ractor.take
    end
  end
end
