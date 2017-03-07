require "redis"
require 'retriable'

def exit_if_not expected, current
  puts "Expected: #{expected}"
  puts "Current: #{current}"
  exit(1) if expected != current
end

Retriable.configure do |c|
	c.tries=5
end

puts "Redis"

Retriable.retriable on: [ Errno::ECONNREFUSED ] do
	puts "retry"
	@redis = Redis.new(host: "redis")
end
@redis.set "foo", "bar"
exit_if_not @redis.get("foo"), "bar"
