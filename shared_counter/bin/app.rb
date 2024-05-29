#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/app"

threads = (ARGV[0] || 100).to_i
puts "Using #{threads} threads..."
puts App.new.go(threads:)
