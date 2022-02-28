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

