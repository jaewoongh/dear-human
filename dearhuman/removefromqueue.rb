#!/usr/bin/ruby
require 'fileutils'

path = ARGV[0] + "queue.list"
number = ARGV[1]
time = ARGV[2]

return if (!File.exist?(path) || File.zero?(path))
File.write(path, File.open(path).read().sub(/#{number},\d+\n/, ''))