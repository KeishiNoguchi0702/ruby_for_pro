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
#

#ハッシュの同値比較、要素数の取得、要素の削除
  a = { "x" => 1, "y" => 2, "z" => 3 }
  b = { "x" => 1, "y" => 2, "z" => 3 }
  a == b #=> true

  #並び順が異なっていてもキーと値がすべて同じならtrue
  c = { "x" => 1, "z" => 3, "y" => 2 }
  a == c #=> true
  b == c #=> true

  #キーのxが異なっているためfalse
  c = { "x" => 10, "z" => 3, "y" => 2 }
  a == c #=> false

  #sizeメソッドとlengthメソッドでハッシュ内の要素の個数を確認できる
  Hash.new.size #=> 0
  a.length      #=> 3

  #deleteメソッドで指定したキーに対応する要素を削除できる
  currencies = {"japan" => "yen", "us" => "dollar", "India" => "ruppe"}
  currencies.delete("japan")
  currencies #=> {"us"=>"dollar", "India"=>"ruppe"}

  #deleteメソッドで指定したキーが無ければnilが返る
  currencies = {"japan" => "yen", "us" => "dollar", "India" => "ruppe"}
  currencies.delete("Rosia") #=> nil
  #ブロックを渡すとキーが見つからないときの戻り値を作成できる
  currencies.delete("Rosia") { |key| "Not found: #{key}" } #=> "Not found: Rosia"
#

#シンボル
  #シンボルと文字列は同じ見た目だが、その中身は異なる

  #シンボルと文字列の違い
  #シンボルは、Symbolクラスのオブジェクト：文字列はStringクラスのオブジェクト
  #シンボルは、表面的には文字列だが、Ruby内部では整数として扱われる

  #文字列よりもシンボルのほうが高速に比較できる
  "apple" == "apple"
  :apple == :apple

  #同じシンボルであれば、全く同じオブジェクトである
  #このため、大量の文字列と大量のシンボルではメモリの使用効率に大きな違いが出てくる
  #object_idを使用して同じ文字列を複数作った場合のobject_idを確認してみる(シンボルのidは同じだが、文字列のidは変わっている)
  :apple.object_id #=> 2174748
  :apple.object_id #=> 2174748

  "apple".object_id #=> 70320628365220
  "apple".object_id #=> 70320628480620

  #シンボルはイミュータブル（破壊的な変更ができない）
  #なにかに名前をつけたいがだれかに勝手に変えられては困る、というケースに向いている
  string = "apple"
  string.upcase!
  string #=> "APPLE"
  symbol = :apple
  symbol.upcase! #=> NoMethodError: undefined method `upcase!' for :apple:Symbol

  #シンボルの特徴まとめ
    #表面上は文字列っぽいので、プログラマにとって理解しやすい
    #内部的には整数なので、コンピュータは高速に値を比較できる
    #同じシンボルは同じオブジェクトであるため、メモリの使用効率が良い
    #イミュータブルなので、勝手に値が変えられる心配がない
  
  #シンボルがよく使われるケースは、ソースコード上では文字列を使用したいが、中身が必ずしも文字列ではない場合
  #ハッシュは、その代表的な使用例である

  #文字列をハッシュのキーにする
  currencies = {"japan" => "yen", "us" => "dollar", "India" => "ruppe"}
  currencies["japan"] #=> "yen"
  #シンボルをハッシュのキーにする
  currencies = { :japan => "yen", :us => "dollar", :india => "ruppe"}
  #シンボルを使って値を取り出す（文字列よりも高速）
  currencies[:japan] #=> "yen"

  #オブジェクトが持っているメソッドをシンボルで管理していることもある
  apple.methods #=> [:encode, ...(以下略)
  :apple.methods #=> [:match, ...(以下略)
#

#続・ハッシュ
  #"シンボル:値"の記法でハッシュで作成する
  currencies =  {japan: "yes", us: "dollar", india: "ruppe"}
  currencies[:us] #=> "dollar"

  #キーと値もハッシュの場合は下記のように記述する
  {japan: :yen, us: :dollar, india: :ruppe}

  #キーや値に異なるデータ型を混在させる
  #文字列のキーとシンボルのキーを混在させる
  hash = {"abc" => 123, def: 456}

  #値を取得する場合はデータ型を合わせてキーを指定する
  hash["abc"] #=> 123
  hash[:def] #=> 456

  #データ型が異なると値を取得できない（エラーにはなならずに、nilが返ってくる）
  hash[:abc] #=> nil
  hash["def"] #=> nil

  #ハッシュに格納する値に関しても、異なるデータ型が混在するケースがよくある
  person = {
    name: "Keishi",
    age: 34,
    friends: ["pisuke", "usagi"],
    phones: {home: "123-456", mobile: "090-1234-5678"}
  }
  #=> {:name=>"Keishi", :age=>34, :friends=>["pisuke", "usagi"], :phones=>{:home=>"123-456", :mobile=>"090-1234-5678"}}
#

#メソッドのキーワード引数とハッシュ
  #架空のメソッド
  def buy_burger(menu, drink, potato)
    if drink
    end
    if potato
    end
  end

  #上のメソッドの内容を見れば意味が掴み取れるが、下記のメソッド呼び出しだけを見ると意味が分かりづらい
  buy_burger("cheese", true, true)
  buy_burger("fish", true, false)

  #架空のメソッド（キーワード引数）
  def buy_burger(menu, drink: true, potato: true)
    if drink
    end
    if potato
    end
  end

  #シンボル：値の記法だと意味がわかりやすい
  buy_burger("cheese", drink: true, potato: true)
  buy_burger("fish", drink: true, potato: false)

  #キーワード引数にはデフォルト値が設定されているため、引数を省略してもよい
  buy_burger("cheese")
  buy_burger("fish", potato:false)

  #キーワード引数は自由に順序を入れ替えられる
  buy_burger("cheese", potato: true, drink: false)

  #キーワード引数のデフォルト値は省略することもできる
  def buy_burger(menu, drink:, potato:)
    if drink
    end
    if potato
    end
  end

  buy_burger("cheese", drink: true, potato: true)

  #キーワード引数と一致するハッシュであれば、メソッドの引数として渡すこともできる
  params = {drink: true, potato: true}
  buy_burger("fish", params)
#

#ハッシュについてもっと詳しく
  #ハッシュで使用頻度の高いメソッド

  #keysメソッド
  currencies = { japan: "yen", us: "dollar", india: "ruppe"}
  currencies.keys # => [:japan, :us, :india]

  #valuesメソッド
  currencies = { japan: "yen", us: "dollar", india: "ruppe"}
  currencies.values #=> ["yen", "dollar", "ruppe"]

  #has_key?, key?, include?, member?
  currencies = { japan: "yen", us: "dollar", india: "ruppe"}
  currencies.has_key?(:japan) #=> true
  #has_key?メソッド意外はすべて、has_key?メソッドのエイリアス
  