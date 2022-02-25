#空の配列を作成し、そのクラス名を確認する
[].class #=> Array

#配列は、次のように改行して記述することもできる
a = [
  1,
  2,
  3
]

#最後の要素に,(カンマ)がついていても、文法上のエラーにはならない
a = [
  1,
  2,
  3,
]

#異なるデータ型を混在させることもできる
a = [1, "apple"]

#配列の中に配列を格納することも可能
a = [[10,20], [30,40]]

#存在しない要素を指定してもエラーにはならず、nilが返ってくる
a = [1,2,3]
a[100] #=> nil

#もとの大きさよりも大きい添字を指定して値を追加すると、間の値がnilになる
a = [1,2,3]
a[4] = 50
a #=> [1,2,3,nil,50]

# <<を使うと、配列の最後に要素を追加できる
a = [1,2,3]
a << 4
a.push(5)

#配列の特定の位置にある要素を削除したい場合は、delete_atメソッドを使用する
a = [1,2,3,4]
a.delete_at(3)

#存在しない要素を指定すると、エラーにはならずにnilが返ってくる
a.delete_at(100) #=> nil

#配列を使って多重代入することができる
a,b = [1,2]
a,b = %w(1 2)

#右辺の数が少ない場合はnilが入る
c, d = [10]

#右辺の数が多い場合ははみ出した値が切り捨てられる
e, f = [100, 200, 300]

#divmodは商と余りを配列で返す
14.divmod(3) #=> [4,2]

#多重代入で別々の辺ストして受け取る
quotient, remainder = 14.divmod(3)

#配列から値が2の要素を削除する
a = [1,2,3,1,2,3]
a.delete(2) #=> [1, 3, 1, 3]

#delete_ifメソッドで配列から値が奇数の要素を削除する
a = [1,2,3,1,2,3]
a.delete_if { |n| n.odd? }

#ブロック内には2行以上のコードを記述できる
numbers = [1,2,3,4]
sum = 0
numbers.each do |n|
  sum_value = n.even?? n * 10 : n
  sum += sum_value
end

#mapメソッド（各要素に対してブロックを評価した結果を、新たな配列に格納する）
numbers = [1,2,3,4,5]
new_numbers = Array.new
numbers.each { |n| new_numbers.push(n * 10) }
new_numbers #=> [10, 20, 30, 40, 50]

#selectメソッドでブロック内の評価が真の値を格納する
numbers = [1,2,3,4,5]
even_numbers = numbers.select { |n| n.even? }
even_numbers #=> [2, 4]

#rejectメソッドで、ブロック内の評価が真の要素を除外する（＝偽の要素を集める）
numbers = [1,2,3,4,5]
non_multiples_of_three = numbers.reject { |n| n % 3 == 0 }
non_multiples_of_three

#findメソッドで、ブロック内の評価が最初に真である要素を格納する
numbers = [1,2,3,4,5]
even_number = numbers.find { |n| n.even? }
even_number

#injectメソッドを使用すれば、①のコードを②のように完結に記述できる

#①
numbers = [1,2,3,4]
sum = 0
numbers.each { |n| sum += n }
sum #=> 10

#②
numbers = [1,2,3,4]
sum = numbers.inject(0) { |result, n| result + n }
sum #=> 10

#&:メソッド以下の2つのコードは同じこと
[1,2,3,4,5,6].select { |n| n.doo? }
[1,2,3,4,5,6].select(&:odd?)

#範囲オブジェクト
(1..5).class #=> Range
(1...5).class #=> Range

#..を使うと5が範囲に含まれる（1以上5以下）
scope = 1..5
scope.include?(0)
scope.include?(1)
scope.include?(4.9)
scope.include?(5)
scope.include?(6)

#...を使うと5が範囲に含まれる（1以上5未満）
scope = 1...5
scope.include?(0)
scope.include?(1)
scope.include?(4.9)
scope.include?(5)
scope.include?(6)

#範囲オブジェクトを使用して、配列や文字列の一部を抜き出す
[1,2,3,4,5][1..3] #=> [2, 3, 4]
"abcdef"[1..3] #=> "bcd"

#n以上m以下（...なら以上未満）の判定を行う
def liquid?(temperature)
  (0..100).include?(temperature)
end
liquid?(-1)
liquid?(10)

#case文で範囲オブジェクトを使用する
def charge(age)
  case age
  when 0..5
    0
  when 6..12
    300
  when 13..18
    600
  else
    1000
  end
end
charge(3)

#値が連続する配列を生成する
(1..5).to_a
(1...5).to_a

("a".."e").to_a
("a"..."e").to_a

("bad".."bag").to_a
("bad"..."bag").to_a

#splat展開
[*1..5] #=> [1,2,3,4,5]
[*1...5] #=> [1,2,3,4]

#範囲オブジェクトを配列に変換しループ処理を実行する
numbers = (1..4).to_a
sum = 0
numbers.each { |n| sum += n }
sum

#stepメソッドでループ処理
numbers = []
(1..10).step(2) { |n| numbers << n }
numbers

#配列[位置, 取得する長さ]
a = [1,2,3,4,5]
a[1,3] #=> [2,3,4]

#values_atメソッドを使用して、複数の要素を添え字を指定して取得
a = [1,2,3,4,5]
a.values_at(0,2,4) #=> [1, 3, 5]

#様々な要素の取得方法------------------------------------------------------------------------
  #特定の添字の配列要素を取得
  a = [1,2,3]

  #最後の要素
  a[a.size - 1]
  a[-1]
  a.last

  #最後から2番目の要素
  a[-2]

  #最後から2番めの要素から2つの要素
  a[-2,2]
  a.last(2)

  #最初の要素
  a[0]
  a.first

  #最初から2つの要素
  a[0,2]
  a.first(2)

#さまざまな要素の変更方法
  a = [1,2,3]
  a[-3] = -10 #=> [-10, 2, 3]
  a[-4] = 0 #指定可能な負の値よりも小さくなるとエラーが発生する（引数が正の場合は、間にnilをはさみながら変数が格納される）

  a = [1,2,3,4,5]
  a[1,3] = 100
  a #=> [1,100,5]

  a = []
  a.push(1) #=> [1]
  a.push(2,3) #=> [1,2,3]

  a = [1,2,3,1,2,3]
  a.delete(2)
  a #=> [1,3,1,3]

  a.delete(5) #=> nil   存在しない値を指定するとnilが返る

#配列の連結方法
a = [1]
b = [2,3]
a.concat(b) #破壊的メソッドのため、配列aは変更される
a #=> [1,2,3]
b #=> [2,3]   bは変更されない

a = [1]
b = [2,3]
a + b #=> [1,2,3]
#aもbも変更されない
a #=> [1]
b #=> [2.3]

#配列の和集合、差集合、積集合

  #和集合
  a = [1,2,3]
  b = [3,4,5]
  a | b #=> [1, 2, 3, 4, 5]

  #差集合
  a - b #=> [1, 2]

  #積集合
  a & b #=> [3]

#Setクラス
require "set"

a = Set.new([1,2,3])
b = Set.new([3,4,5])
a | b #=> #<Set: {1, 2, 3, 4, 5}>
a - b #=> #<Set: {1, 2}>
a & b #=> #<Set: {3}>

#多重代入で残りの全要素を配列として受け取る
e, f = 100, 200, 300  #この指定の仕方では、一番右側の300が切り捨てられる

e, *f = 100, 200, 300
e #=> 100
f #=> [200, 300]

#1つの配列を複数の引数として展開する(splat展開)
a = []
b = [2,3]
a.push(1) #=> [1]
a.push(*b) #=>[1,2,3]
a.push(*[4,5]) #=> [1,2,3,4,5]

#メソッドの可変長引数
def greeting(*names)
  "#{names.join("と")}、こんにちは！"
end
greeting("もーくーさん")
greeting("もーくーさん", "けーくんさん")
greeting("もーくーさん", "けーくんさん", "pohさん")
