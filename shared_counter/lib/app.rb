# frozen_string_literal: true

require_relative "counter"
require_relative "totaliser"
require_relative "dummy_service"

class App
  def initialize
    @counter = Counter.new
    @totaliser = Totaliser.new
    @service = DummyService.new(@counter)
  end

  def go(threads: 100)
    threads.times.map do
      Thread.new do
        10.times do
          @totaliser.add(@service.call)
        end
      end
    end.each(&:join)
    @totaliser.total
  end
end
