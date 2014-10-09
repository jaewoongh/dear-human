#!/usr/bin/ruby
require 'fileutils'

filepath = ARGV[0] + "queue.list"
newnumber = ARGV[1]

def addNewNumber(path, number)
	return unless (/^\+\d{11}$/ =~ number)
	File.open(path, 'a').puts(number[1..-1] + "," + Time.now.to_i.to_s)
end

addNewNumber filepath, newnumber