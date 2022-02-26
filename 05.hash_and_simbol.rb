#5-2.ハッシュ

  #ハッシュはキーと値の組み合わせでデータを管理するオブジェクト
  #他の言語ではディクショナリ、マップと呼ばれることがある
  #ハッシュを作成するときには以下のような構文（ハッシュリテラル）を使う

  {}.class #=> Hash
  Hash.new
  
  #国ごとに通貨の単位を格納したハッシュを作成する
  {"japan" => "yen", "us" => "dollar", "india" => "ruppe"}

  #改行してハッシュを作ることも可能
  {
    "japan" => "yen", 
    "us" => "dollar", 
    "india" => "ruppe"
  }

  #配列と同様、最後にカンマが付いていてもエラーにはならない
  {
    "japan" => "yen", 
    "us" => "dollar", 
    "india" => "ruppe",
  }

  #同じキーが複数使われた場合は、最後に出てきた値が有効になる（極力こんな書き方をしない）
  {"japan" => "yen", "japan" => "円"}
  #=> {"japan"=>"円"}

  #既存のハッシュに新しいキーペアを追加する
  currencies = Hash.new
  currencies["Italy"] = "euro"
  currencies #=> {"Italy"=>"euro"}
  #すでにキーが入っていた場合には上書きされる
  currencies["Italy"] = "ユーロ"
  currencies #=> {"Italy"=>"ユーロ"}

  #ハッシュのキーを指定して値を取得する方法
  #ハッシュは内部構造上、大量にデータが格納されていても高速で取得できることが特徴
  currencies = { "japan" => "yen"}
  currencies["japan"] #=> "yen"
  #存在しないキーを指定した場合にはnilが返ってくる
  currencies["Rosia"] #=> nil
#

#ハッシュを使用した繰り返し処理

  #eachメソッドにより、KVSを順番に取り出すことができる
  #ブロック引数が2つである点に注意が必要
  currencies = {"japan" => "yen", "us" => "dollar", "India" => "ruppe"}
  currencies.each do |key, value|
    puts "#{key}:#{value}"
  end
  #japan:yen
  #us:dollar
  #India:ruppe

  #ブロック引数を1つにするとキーと値が配列に格納される
  currencies = {"japan" => "yen", "us" => "dollar", "India" => "ruppe"}
  currencies.each do |key_value|
    key = key_value[0]
    value = key_value[1]
    puts "#{key}, #{value}"
  end
  #japan, yen
  #us, dollar
  #India, ruppe