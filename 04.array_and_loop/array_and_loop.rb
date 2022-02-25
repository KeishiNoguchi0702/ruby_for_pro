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