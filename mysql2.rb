# coding: utf-8
require 'mysql2'

puts "Light Data Browser of snOPY"

host_name = "localhost"
user_name = "root"
password = "riboribo"
database_name = "snodb"
puts "host_name:#{host_name}
user_name:#{user_name}
password:***
database_name:#{database_name}"

client = nil
begin #Acception sequence start
  client = Mysql2::Client.new(:host => host_name,
                              :username => user_name,
                              :password => password,
                              :database => database_name)
rescue => ex #Exception object is into ex
  puts "Database connection error!"
  puts ex.class, ex.message
  exit
else #when doesn't occur acception
  puts "Database connection success!"
#ensure
#  puts "Database connection action is done."
end

print "Which table can I show? : "
table = gets.chomp
organisms_tmp = client.query("select distinct organism from #{table}", :as => :array)
organisms = Array.new
organisms_tmp.each_with_index { |line| organisms.push(line[0].to_s) }

puts "テーブル#{table}には#{organisms.length}種の生物種があります"
organisms.each_with_index do |value, index|
  puts "#{index}:#{value}"
end

while(true) do
  print "どの生物種を閲覧しますか?(indexを指定) : "
  selected_organism_number = gets.chomp.to_i
  selected_organism = organisms[selected_organism_number]
  puts "#{selected_organism}が選択されました"

  print "何件目のデータを閲覧しますか? : "
  selected_data_number = gets.chomp
  #id="Arabidopsis_thaliana300001"
  id = selected_organism + selected_data_number
  p id
  results = client.query("select * from #{table} where id = '#{id}'")

  puts "#{results.count}件ヒット"
  results.each do |row|
    row.each do |key, value|
      puts "#{key} ==> #{value}"
    end
  end
  puts
end

