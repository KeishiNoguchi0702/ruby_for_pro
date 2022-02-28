#正規表現とは
  #プログラミング言語別の挙動の違いを方言と言うことがある
  
  #正規表現でプログラミング言語の名称をスキャンする
  text = <<TEXT
  I love Ruby.
  Pytho is a great language.
  Java and JavaScript are different.
TEXT
  
  text.scan(/[A-Z][A-Za-z]+/)

  #[補足]scanメソッド：selfに対して patternを繰り返しマッチし、マッチした部分文字列の配列を返す
  p "foobar".scan(/../)               # => ["fo", "ob", "ar"]
  p "foobar".scan("o")                # => ["o", "o"]
  p "foobarbazfoobarbaz".scan(/ba./)  # => ["bar", "baz", "bar", "baz"]

  p "foobar".scan(/(.)/) # => [["f"], ["o"], ["o"], ["b"], ["a"], ["r"]]

  p "foobarbazfoobarbaz".scan(/(ba)(.)/) # => [["ba", "r"], ["ba", "z"], ["ba", "r"], ["ba", "z"]]
#

#郵便番号の途中にハイフンを挿入するサンプル
text = <<TEXT
  私の郵便番号は1234567です。
  僕の住所は6770056兵庫県西脇市板並町1234だよ。
TEXT

puts text.gsub(/(\d{3})(\d{4})/, '\1-\2')

#電話番号を探す
text = <<-TEXT
名前：伊藤淳一
電話：03-1234-5678
住所：兵庫県西脇市板波町1-2-3
TEXT
text.scan /\d\d-\d\d\d\d-\d\d\d\d/
