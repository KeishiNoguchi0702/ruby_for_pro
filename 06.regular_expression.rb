#正規表現とは
  #プログラミング言語別の挙動の違いを方言と言うことがある
  
  #正規表現でプログラミング言語の名称をスキャンする
  text = <<TEXT
  I love Ruby.
  Pytho is a great language.
  Java and JavaScript are different.
TEXT
  
  text.scan(/[A-Z][A-Za-z]+/)
#