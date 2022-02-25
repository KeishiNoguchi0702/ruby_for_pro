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