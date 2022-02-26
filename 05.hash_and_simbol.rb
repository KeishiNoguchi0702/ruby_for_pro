#5-2.ハッシュ

  #ハッシュはキーと値の組み合わせでデータを管理するオブジェクト
  #他の言語ではディクショナリ、マップと呼ばれることがある
  #ハッシュを作成するときには以下のような構文（ハッシュリテラル）を使う

  {}.class #=> Hash
  
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