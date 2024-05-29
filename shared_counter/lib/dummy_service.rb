# frozen_string_literal: true

class DummyService
  def initialize(counter)
    @counter = counter
  end

  def call
    value = @counter.next
    sleep(rand)
    value
  end
end
