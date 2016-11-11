# coding: utf-8
### Line.rb
### 立山博基 Hiroki Tachiyama
### 2016/03/17 作成
### 行クラス 双方向リストで実装
###

class Line
  attr_accessor :link_prev, :link_next, :text
  def initialize(text = nil)
    @text = text
    @link_prev, @link_next = nil, nil
  end

  #次のノードを繋ぐ
  def link_next_line(line_next)
    line_next.link_next = @link_next
    @link_next = line_next
    line_next.link_prev = self
  end

  #この行を双方向リストから削除する
  def delete_this_line
    @link_prev.link_next = @link_next
    @link_next.link_prev = @link_prev
  end

end

