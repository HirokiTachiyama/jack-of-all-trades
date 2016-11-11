# coding: utf-8
### TextEditor.rb
### 立山博基 Hiroki Tachiyama
### 2016/03/17 作成
### メインクラス
require_relative 'BufferManager'

puts "an Text Editor on Ruby"

buffer_manager = BufferManager.new

buffer_manager.set_text(0, "abc")

buffer_manager.add_line_to_eol
buffer_manager.add_line_to_eol
buffer_manager.add_line_to_eol
buffer_manager.set_text(1, "def")
buffer_manager.set_text(2, "ghi")
buffer_manager.set_text(3, "jkl")
buffer_manager.show_buffer

buffer_manager.delete_eol
buffer_manager.show_buffer



buffer_manager.add_line(1)
buffer_manager.set_text(1, "HOGE")
buffer_manager.show_buffer

buffer_manager.delete_line(2)
buffer_manager.show_buffer

