# coding: utf-8

=begin

***
*** File name: todo.rb
*** Create:    2016, 11/2(Wed) 00:54
*** Author:    Hiroki Tachiyama
***

* DO NOT USE CYGWIN TERMINAL !! to operate mysql and ruby gem while development.
* -> To operate mysql, use MySQL Workbench or of MySQL's terminal.
* -> To operate ruby gem, use Ruby's terminal.
* Because of imperfection in  setting of environment variables.
* 

=end
require_relative "super_function"


class Todo < super_function

  def main_loop
    while print "joat ? Todo : " or input = STDIN.gets
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

    puts "end Todo"
  end

  

end

