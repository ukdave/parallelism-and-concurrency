#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/buffer"
require_relative "../lib/consumer"
require_relative "../lib/producer"

buffer = Buffer.new(10)
# buffer = SizedQueue.new(10)

producer = Producer.new(buffer)
consumer = Consumer.new(buffer)

t1 = producer.go
sleep 2
t2 = consumer.go

t1.join
t2.join
