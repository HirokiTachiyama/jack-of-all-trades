#!/usr/local/bin/ruby
# coding: utf-8

=begin

***
*** File name: main.rb
*** Create:    2016, 11/1(Tue) 19:30
*** Author:    Hiroki Tachiyama
***

* DO NOT USE CYGWIN TERMINAL !! to operate mysql and ruby gem while development.
* -> To operate mysql, use MySQL Workbench or of MySQL's terminal.
* -> To operate ruby gem, use Ruby's terminal.
* Because of imperfection in  setting of environment variables.
=end

require 'mysql2'


puts "Welcome to Jack of all trades... :)\n" + "Be Lazy Programmer!\n\n"

while input = STDIN.gets
  break if input.chomp == "exit"
  input.chomp!
  puts input
end

client = Mysql2::Client.new(:host     => "localhost",
                            :username => "ht",
                            :password => "gundam",
                            :database => "jack-of-all-trades")
client.query("SELECT number, name FROM test_table").each do |col1, col2|
  p col1, col2
end

#val1 = 123
#val2 = client.escape('abc')
#client.query("INSERT INTO tblname (col1,col2) VALUES (#{val1},'#{val2}')")

