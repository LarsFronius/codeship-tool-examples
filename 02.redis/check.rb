require "redis"

def exit_if_not expected, current
  puts "Expected: #{expected}"
  puts "Current: #{current}"
  exit(1) if expected != current
end

puts "Redis"
redis = Redis.new(host: "redis", reconnect_attempts: 10)
redis.set "foo", "bar"
exit_if_not redis.get("foo"), "bar"
