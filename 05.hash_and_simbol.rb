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
  
  #**でハッシュ展開
  h = {us: "dollar", india: "ruppe"}
  {japan: "yen", **h } #> {:japan=>"yen", :us=>"dollar", :india=>"ruppe"}

  #**をつけない場合はエラー構文になる
  {japan: "yen", h}
  #SyntaxError: unexpected '}', expecting =>
  #{japan: "yen", h}
  #                ^

  #mergeメソッドでも同じ結果を得ることができる
  h = {us: "dollar", india: "ruppe"}
  {japan: "yen"}.merge(h) #=> {:japan=>"yen", :us=>"dollar", :india=>"ruppe"}
#

#ハッシュを使った疑似キーワード引数
  #ハッシュを引数として受け取り、疑似キーワード引数を実現する
  #ハッシュを受け取ってキーワード引数のように見せるテクニックを擬似キーワードという
  def buy_burger(menu, options = {})
    drink = options[:drink]
    potato = options[:potato]
  end

  buy_burger("cheese", drink: true, potate: true)

  #疑似キーワード引数の場合は、どんなキーワードを指定してもエラーにならない
  #無効なキーをエラーにするためには明示的な実装が必要
  #特別な理由がない限り、疑似キーワードよりもキーワード引数を使用したほうがよい
  buy_burger("fish", slad: true) #=> nil
#

#任意のキーワードを受け付ける**引数
  #キーワード引数では、無効なキーワード引数を指定するとエラーになる
  #**引数を使用すると、想定外のキーワードぉothers引数でハッシュとして受け取る
  #可変長引数と同じ考え方
  def buy_burger(menu, drink: true, potato: true, **others)
    puts others
  end

  buy_burger("fish", drink: true, potato: false, salad: true, chicken: false)
  #{:salad=>true, :chicken=>false}
#

#メソッドの呼び出し時の{}の省略
  #Rubyでは「最後の引数がハッシュであれば、ハッシュリテラルの{}を省略できる」ルールがある
  #optionsは任意のハッシュを受け付ける
  def buy_burger(menu, options = {})
    puts options
  end
  #キーを文字列にしたハッシュを渡すこともできるし、間違いではない
  buy_burger("fish", {"drink" => true, "potato" => false}) #{"drink"=>true, "potato"=>false}
  #ハッシュリテラルの{}を省略してメソッドを呼び出す
  buy_burger("fish", "drink" => true, "potato" => false) #{"drink"=>true, "potato"=>false}
#

#ハッシュリテラルの{}とブロックの{}
  #下記のコードに対して...
  def buy_burger(menu, options = {})
    puts options
  end
  
  #以下のコードを実行するとエラーになる
  #理由は、{}がハッシュリテラルではなくブロックの{}だとRubyに解釈されたため
  buy_burger {"drink" => true, "potato" => false}
    #SyntaxError: unexpected =>, expecting '}'
    #buy_burger {"drink" => true, "potato" => false}
    #                    ^~
  
    #メソッドの第1引数にハッシュを渡そうとする場合は必ず()をつけてメソッドを呼び出さなければならない
  buy_burger({"drink" => true, "potato" => false})
  
  #第2引数硫黄にハッシュが来る場合は、()を省略してもエラーにはならない
  buy_burger "fish", {"drink" => true, "potato" => false} #{"drink"=>true, "potato"=>false}
#

#ハッシュから配列へ、配列からハッシュへ
  #ハッシュはto_aメソッドで配列に変換が可能。キーとバリューが1つの配列になり、ネストされる
  currencies = {japan: "yen", us: "dollar", indian: "ruppe"}
  currencies.to_a #=> [[:japan, "yen"], [:us, "dollar"], [:indian, "ruppe"]]

  #配列に対してto_hメソッドを呼ぶと、配列をハッシュに変換できる
  #ハッシュに変換する配列はキーと値の組み合わせごとに1つの配列に入る
  array = [[:japan, "yen"], [:us, "dollar"], [:indian, "ruppe"]]
  array.to_h #=> {:japan=>"yen", :us=>"dollar", :indian=>"ruppe"}

  #ハッシュとして解析不可能な配列に対してto_hメソッドを呼び出した場合はエラーになる
  array = %w(apple orange melon)
  array.to_h #TypeError: wrong element type String at 0 (expected array)

  #キーが重複する場合は最後のものが上書きされるが、基本こんな書き方をしてはダメ
  array = [[:japan, "yen"], [:japan, "円"]]
  array.to_h #=> {:japan=>"円"}

  #昔のやり方：キーと値のペアの配列をHash[]に渡す
  array = [[:japan, "yen"], [:us, "dollar"], [:indian, "ruppe"]]
  Hash[array] #=> {:japan=>"yen", :us=>"dollar", :indian=>"ruppe"}

  #キーと値が交互に並ぶフラットな配列をsplat展開してもよい
  array = [:japan, "yen", :us, "dollar", :inidian, "ruppe"]
  Hash[*array] #=> {:japan=>"yen", :us=>"dollar", :inidian=>"ruppe"}
#

#ハッシュの初期値を理解する
  #ハッシュに対して存在しないキーを指定するとnilが返る
  h = Hash.new
  h[:foo] #=> nil

  #nil以外の値を返したい場合は、Hash.newでハッシュを作成し、引数に初期値を記述する
  h = Hash.new("hello")
  h[:foo] #=> "hello"

  #配列の初期値と同様に、参照の概念を正確に理解しておかないと思わぬエラーを起こしてしまう可能性がある
  #newの引数として初期値を指定した場合は、初期値として毎回同じオブジェクトが入る
  #初期値に対して破壊的な変更を適用すると、他の変数の値も一緒に変わってしまう

  h = Hash.new("hello")
  a = h[:foo]
  b = h[:bar]

  #aとbは同じオブジェクト
  a.equal?(b) #=> true

  #変数aには快適な変更を適用すると、変数bの値も一緒に変わってしまう
  a.upcase!
  a #=> "HELLO"
  b #=> "HELLO"

  #ハッシュそのものは空のまま
  h #=> {}

  #-------------------------------------------------------------------
  #文字列や配列など、ミュータブルなオブジェクトを初期値として返す場合は、
  #Hash.newとブロックを組み合わせて初期値を返すことで、このような問題を避けることができる

  #キーが見つからないとブロックがその都度実行され、ブロックの戻り地が初期値になる
  h = Hash.new {"hello"}
  a = h[:foo] #=> "hello"
  b = h[:bar] #=> "hello"

  #変数aとbは異なるオブジェクト（ブロックの実行時に毎回新しい文字列が作成される）
  a.equal?(b) #=> false

  #変数aに破壊的な変更を適用しても、変数bの値は変わらない
  a.upcase!
  a #=> "HELLO"
  b #=> "hello"

  #ハッシュは空のまま
  h #=> {}

  #-------------------------------------------------------------------
  #Hash.newにブロックを与えると、ブロック引数として、「ハッシュ自身」と「見つからなかったキー」が返る
  h = Hash.new{ |hash, key| hash[key] = "hello" }
  h[:foo]
  h[:bar]

  #ハッシュにキーと値が追加されている
  h #=> {:foo=>"hello", :bar=>"hello"}
#

#シンボルについてもっと詳しく
  #シンボルを作成するさまざまな方法
  :apple #変数名
  :Apple #クラス名
  :ruby_is_fun #メソッド名
  :okay? #メソッド名
  :welcome!
  :_secret
  :$dollar #グローバル変数
  :@at_mark #インスタンス変数

  #識別子として無効な文字列：数字で始まる、ハイフンやスペースが含まれる文字列
  :12345
  :ruby-is-fun
  :ruby is fun
  :()

  #ただし、上記の場合でもシングルクォートで囲むと有効になる
  :'12344'
  :'ruby-is-fun'
  :'ruby is fun'
  :'()'

  #ダブルクオーテーションを使うと、シンボル名の生成に式展開を利用できる
  name = "Alice"
  :"#{name.upcase}" #=> :ALICE

  #ハッシュを作成する際に"文字列：値"の形式で書いた場合も、":文字列"と同じようにみなされ、キーがシンボルになる
  hash = { 'abc': 123 } #=> {:abc=>123}
#

#%記法でシンボルやシンボルの配列を作成する
  #!を区切り文字に使う
  %s!ruby is fun! #=> :"ruby is fun"

  #()を区切り文字に使う
  %s(ruby is fun) #=> :"ruby is fun"

  #%i()記法でシンボルの配列を作る
  %i(apple orange melon) #=> [:apple, :orange, :melon]

  #改行文字を含めたり、式展開する場合は%Iを使用する
  name = "Alice"
  #%iは改行文字や式典会の構文が、そのままシンボルになる
  %i(hello\ngood-bye #{name.upcase}) #=> [:"hello\\ngood-bye", :"\#{name.upcase}"]
  #%Iは改行文字や式典会が勇往になった上でシンボルを作る
  %I(hello\ngood-bye #{name.upcase}) #=> [:"hello\ngood-bye", :ALICE]
#

#シンボルと文字列の関係
  #文字列とシンボルは見た目は同じでも、別のオブジェクトのため互換性は無い
  string = "apple"
  symbol = :apple

  string == symbol #=> false
  string + symbol #=> TypeError: no implicit conversion of Symbol into String

  #ただし、to_symメソッドを使用すると、文字列をシンボルに変換することができる
  string = "apple"
  symbol = :apple

  string.to_sym
  string.to_sym == symbol #=> ture

  #シンボルを文字列に変換する場合はto_sメソッドを使用する
  string = "apple"
  symbol = :apple

  symbol.to_s #=> "apple"
  string == symbol.to_s #=> true
  string + symbol.to_s #=> "appleapple"

  #エイリアスメソッドのid2nameでも実現できる
  :apple.id2name #=> "apple"

  #メソッドによっては文字列とシンボルを同等に扱うものがある
  #respond_to?メソッドの引数には文字列とシンボル療法を渡せる
  "apple".respond_to?("include?") #=> true
  "apple".respond_to?(:include?) #=> true

  "apple".respond_to?("foo_bar") #=> false
  "apple".respond_to?(:foo_bar) #=> false

  #ただし、一般的には文字列とシンボルを同等には扱わないと心得ておくべき
  "apple".include?("pp") #=> true
  "apple".include?(:pp) #TypeError: no implicit conversion of Symbol into String
#

#よく使われるイディオム：条件分岐で変数に代入 / &.演算子
  #変数への代入と条件分岐を同時に実現するイディオム

    #国名に応じて通貨を返す（該当する通貨がなければnil）
    def find_currency(country)
      currencies = { japan: "yen", us: "dollar", india: "ruppe"}
      currencies[country]
    end
    
    #指定された国の通貨を大文字にして返す
    def show_currency(country)
      currency = find_currency(country)
      #nilではないことを確認（nilだとupcaseが呼び出せないため）
      if currency
        currency.upcase
      end
    end