#!/usr/bin/env ruby

$: << ENV['PWD']
require 'hakorb'

w = World.new(10,10,10)
w.load('map001.txt')
puts w.show_slice(0)
