#!/usr/bin/env ruby

$: << ENV['PWD']
require 'world'

w = World.new(10,10,10)
w.load('map001')
puts w[1,2,3]
w[1,2,3] = 'hoge'
puts w[1,2,3]
