#!/usr/bin/ruby
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

#require 'mysql2'
#require 'tk'
require_relative "functions/todo"
puts "I'm Jack of all trades... let's be Lazy Programmer! :)\n\n"
=begin
button = TkButton.new
button.text = 'exit'
button.command = proc { exit }
button.pack

Tk.mainloop
=end

while print "joat ? " or input = STDIN.gets
  #exit or quit, both of uppercase letter and lower letter
  break if input.chomp! =~ /exit|quit/i
  
  case input
  when /help/i then
    puts "HELP"
  when /todo/i then
    Todo.new.main_loop
  else
    puts "ELSE"
  end # - case

end

=begin
client = Mysql2::Client.new(:host     => "localhost",
                            :username => "ht",
                            :password => "gundam",
                            :database => "jack-of-all-trades")
client.query("SELECT number, name FROM test_table").each do |col1, col2|
  p col1, col2
end
=end
#val1 = 123
#val2 = client.escape('abc')
#client.query("INSERT INTO tblname (col1,col2) VALUES (#{val1},'#{val2}')")

puts "have a nice hacking!"

