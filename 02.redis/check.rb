o = [('a'..'z')].map(&:to_a).flatten
string = (0...1000000).map { o[rand(o.length)] }.join
puts string
