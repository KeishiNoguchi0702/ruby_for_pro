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

#*で配列どうしを非破壊的に連結する
a = [1,2,3]
[a] #[]のなかにそのまま配列を置くと、ネスト配列になる
[*a] #*つきで配列を置くと、展開されて別々の要素になる
[-1,0,*a,4,5,]

#==で配列が等しいかを判定する
["1","2","3"] == %w(1 2 3)

#%Wで文字列の配列を簡潔に生成する
prefix = "This is"
%W(#{prefix}\ an\ apple small\nmelon orange) #バックスラッシュを使用する場合は、%wではなく%Wを使用する

#文字列を配列に変換する
"Ruby".chars #=> ["R", "u", "b", "y"]
"miku,keishi,poh,puu".split(",") #=> ["miku", "keishi", "poh", "puu"]

#配列に初期値を設定する

#以下のコードは同じ
a = Array.new
a = []

#要素が5つの配列を作成する
a = Array.new(5)
a #=> [nil, nil, nil, nil, nil]

#要素が5つで初期値が0の配列を作成する
a = Array.new(5,0)
a #=> [0, 0, 0, 0, 0]

#配列に初期値を設定する場合の注意点

  #①通常の配列の生成方法の場合
  a = Array.new(5, "default")
  a #=> => ["default", "default", "default", "default", "default"]
  str = a[0]
  str #=> "default"
  str.upcase!
  a #=> ["DEFAULT", "DEFAULT", "DEFAULT", "DEFAULT", "DEFAULT"]   初期値は配列の要素がすべて同じオブジェクトを参照しているためにこうなる

  #②ブロックを使用する場合
  a = Array.new(5) {"default"}
  a #=> => ["default", "default", "default", "default", "default"]
  str = a[0]
  str #=> "default"
  str.upcase!
  a #=> ["DEFAULT", "default", "default", "default", "default"]   ブロックを使用した場合は、ブロックが呼ばれるために別々のオブジェクトが生成されるため①の問題を回避できる

#添字付きの繰り返し処理
fruits = ["apple", "orange", "melon"]
fruits.each_with_index { |fruit, i| puts "#{i}:#{fruit}" }

#with_indexメソッドを使った添字付きの処理

#mapメソッドとwith_indexメソッドの組み合わせ
fruits = %w(apple orange melon)
fruits.map.with_index { |fruit, i| "#{i}:#{fruit}" }
#=> ["0:apple", "1:orange", "2:melon"]

#delete_ifメソッドとwith_indexの組み合わせ
fruits = %w(apple orange melon)
fruits.delete_if.with_index { |fruit, i| fruit.include?("a") && i.odd? }
#=> ["apple", "melon"]

#eachメソッドでブロックに配列を渡す

  #ふつうの受け取り方
  dimensions = [
    #[縦,横]
    [10,20],
    [30,40],
    [50,60]
  ]

  areas = []

  dimensions.each do |dimension|
    length = dimension[0]
    width = dimension[1]
    areas << length * width
  end

  areas #=> => [200, 1200, 3000]

#配列がブロック引数に渡される場合
  #ブロックの引数を2つに分けた場合
  dimensions = [
    [10,20],
    [30,40],
    [50,60]
  ]

  areas = []

  dimensions.each do |length, width|
    areas << length * width
  end

  areas #=> => [200, 1200, 3000]

  #ブロックの引数が多すぎる場合ははみ出した分にはnilが格納される
  dimensions = [
    [10,20],
    [30,40],
    [50,60]
  ]

  dimensions.each do |length, width, foo, bar|
    p [length, width, foo, bar]
  end
  #[10, 20, nil, nil]
  #[30, 40, nil, nil]
  #[50, 60, nil, nil]

  #ブロック引数がもとの配列に対して少ない場合、はみ出した分は切り捨てられる
  dimension = [
    [10,20,30,40],
    [50,60,70,80],
    [90,100,110,120]
  ]

  dimension.each do |length, width|
    p [length, width]
  end
  #[10, 20]            
  #[50, 60]
  #[90, 100]

  #each_index_withメソッドのように、もとから引数を2つ受け取る場合
  dimensions = [
    [10,20],
    [30,40],
    [50,60]
  ]

  dimensions.each_with_index do |(length, width), i|
    puts "length: #{length}, width: #{width}, i: #{i}"
  end
  #length: 10, width: 20, i: 0
  #length: 30, width: 40, i: 1
  #length: 50, width: 60, i: 2

#ブロックローカル変数：ブロック内外で偶然同じ名前の変数を使ってしまった場合に、エラーや予期せぬ動作を防止するために致し方なく使う感じ
numbers = [1,2,3,4]
sum = 0

  #ブロック外の変数sumとは異なる同じ名称の変数sumを用意する
numbers.each do |n;sum|
    #別物の変数sumを10で初期化し、ブロック引数の値を加算する
  sum = 10
  sum  += n
  p sum
end
sum

sum   #ブロックの中で使っていたsumは別物なので、ブロックの外のsumには変化がない
  #11
  #12
  #13
  #14

#繰り返し処理以外でも使用されるブロック

  #sample.txtを開いて文字列を書き込む。ファイルのクローズは自動的に行われる。
File.open("./sample.txt","w") do |file|
  file.puts("1行目のテキストです。")
  file.puts("2行目のテキストです。")
  file.puts("3行目のテキストです。")
end

#do...endと{}の結合度の違い
  a = [1,2,3]
  a.delete(100) #=> nil :ブロックを渡さない場合はnilが返る

  #ブロックを渡した場合、指定された値が見つからないときは、ブロック内に記述した値が戻り値になる
  a.delete(100) do
    "みつかりません"
  end

  #上記のコードを引数に()を使わずに{}で記述するとエラーになる
  a.delete 100 {"みつかりません"}
    #=> SyntaxError: unexpected '{', expecting end-of-input a.delete 100 {"みつかりません"}
  #理由は、結合度の違いによってa.delete 100ではなく100 {"NG"}と解釈されてしまうため

  #以下のように引数指定に()を使用すればエラーにならない
  a.delete(100) {"みつかりません"}
#

#ブロックの直後にメソッドを記述
  #{}の直後に記述する場合（こちらはわかりやすい）
  names = ["miku", "keishi", "pisuke", "usagi"]
  san_names = names.map { |name| "#{name}さん"}.join("と")

  #endの直後に記述する場合（こちらは分かりづらいので、おすすめではない）
  names = ["miku", "keishi", "pisuke", "usagi"]
  san_names = names.map do |name|
    "#{name}さん"
  end.join("と")

#timesメソッド
  sum = 0
  5.times {|n| sum += n}
  sum #=> 10

#uptoメソッドとdowntoメソッド
  a = Array.new
  1.upto(4) { |i| a << i}
  a

  a = Array.new
  10.downto(1) {|i| a.push(i)}
  a

#stepメソッド
  a = Array.new
  1.step(10,2) {|n| a.push(n) }
  a #=> [1, 3, 5, 7, 9]

  a = Array.new
  10.step(0,-2) {|n| a.push(n) }
  a

#while文
  #配列の要素数が5つになるまで要素を追加する
  a = Array.new
  while a.size < 5
    a.push(1)
  end
  a #=> [1, 1, 1, 1, 1]

  #条件式の後にdoを入れて1行で記述する
  a = Array.new
  while a.size < 5 do a.push(1) end
  a #=> [1, 1, 1, 1, 1]

  #上記のコードを、whileを修飾子として後ろに挿入することでわかりやすくする
  a = Array.new
  a.push(1) while a.size < 5
  a #=> [1, 1, 1, 1, 1]

  #begin..endで条件に関係なく必ず1度は実行するようにする

  #下記コードは必ず評価結果が偽になるため1度も実行されない
    a = Array.new
    while false
      a.push(1)
    end
    a #=> []

  #下記コードであれば、必ず1度は実行される
    a = Array.new
    begin 
      a.push(1)
    end while false
    a #=> [1]
#

#whileの逆であるuntil文
  a = [10,20,30,40,50]
  until a.size <= 3
    a.delete_at(-1)
  end
  a
#

#Rubyでは余り使用しないfor文
  #for..endの記法
  numbers = [1,2,3,4,5]
  sum = 0
  for num in numbers
    sum += num
  end
  sum #=> 15

  #doを入れることで1行で記述する方法
  numbers = [1,2,3,4,5]
  sum = 0
  for num in numbers do sum += num end
  sum #=> 15

  #forで実現できることはeachメソッドで実現できるが、for文の中で登場したローカル変数をfor文の外でも使用できる点が異なる
  numbers = [1,2,3,4,5]
  for num in numbers
    sum += num
  end
  sum
#

#loopメソッド
  #while文を使って敢えて無限ループをさせる場合
  while true
  end

  #kernelモジュールのloopメソッドを使用する場合
  loop do
  end