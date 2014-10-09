#!/usr/bin/ruby
require 'fileutils'

def getFirstOneFromList(path)
	return "nobody" if (!File.exist?(path + "queue.list") || File.zero?(path + "queue.list"))

	line = File.open(path + "queue.list", &:readline).strip.split(",")
	number = line[0]
	time = line[1]

	return number if (Time.now.to_i - time.to_i < 300)

	system "#{path}removefromqueue.rb #{path} #{number}"
	return getFirstOneFromList(ARGV[0] + "queue.list")
end

puts getFirstOneFromList(ARGV[0])