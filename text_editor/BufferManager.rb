# coding: utf-8
### LineManager.rb
### 立山博基 Hiroki Tachiyama
### 2016/03/17 作成
### バッファ管理クラス
### Lineを双方向リストで繋ぎ、テキストとする
### これをバッファと定義する
### バッファの初期状態は始点ノード+0行目+終点ノード


### TODO 末尾を追加?

require_relative 'Line'

class BufferManager
  attr_accessor :loc
  def initialize
    @loc = 0 #lines of code
    @top = @end = Line.new #始点 コード行にはカウントせず、テキストも持たない
    @top.link_next_line(Line.new) #0行目
#    @top.line_next.link_next_line(@end) #末尾
    @loc += 1
  end


  #指定行に新しい行を追加
  def add_line(number_line)
    line_prev_of_new_line = get_line(number_line-1) #指定行の一行前
    line_prev_of_new_line.link_next_line(Line.new)
    @loc += 1
  end

  #指定行を削除
  def delete_line(number_line)
    line = get_line(number_line)
    line.delete_this_line
    @loc -= 1
  end

  #末尾(end of line)に一行追加
  def add_line_to_eol
    line_end = get_line(@loc - 1) #最後の行のindexは総行数-1(0行目からカウントする為)
    line_end.link_next_line(Line.new)
    @loc += 1
  end

  #末尾を一行削除
  def delete_eol
    line_end = get_line(@loc - 1) #最後の行のindexは総行数-1(0行目からカウントする為)
    line_end.delete_this_line
    @loc -= 1
  end

  #双方向リストをnumber_line番目まで辿る
  def get_line(number_line)
    line_current = @top.link_next
    number_line.times do
      line_current = line_current.link_next
    end
    line_current
  end

  #number_line行目のLineにtextをセット
  def set_text(number_line, text)
    line_target = get_line(number_line)
    line_target.text = text
  end

  #現在のテキストを見せる
  def show_buffer
    puts "Lines of Code:#{@loc}"
    line = @top
    @loc.times do |index|
      line = line.link_next
      puts "#{index} #{line.text}"
    end
  end

end
