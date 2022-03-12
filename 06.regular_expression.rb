#初心者歓迎！手と目で覚える正規表現入門・その１「さまざまな形式の電話番号を検索しよう」
#https://qiita.com/jnchito/items/893c887fbf19e17d3ff9

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
text = <<TEXT
名前：伊藤淳一
電話：03-1234-5678
住所：兵庫県西脇市板波町1-2-3
TEXT
text.scan /\d\d-\d\d\d\d-\d\d\d\d/

#様々な市外局番の桁数に対応させて電話番号を見つけ出す
text =<<TEXT
  名前：伊藤淳一
  電話：03-1234-5678
  電話：090-1234-5678
  電話：0795-12-3456
  電話：04992-1-2345
  住所：兵庫県西脇市板波町1-2-3
TEXT

text.scan /\d{2,5}\-\d{1,4}\-\d{1,4}/ #=> ["03-1234-5678", "090-1234-5678", "0795-12-3456", "04992-1-2345"]

#ハイフンだけではなく、カッコにも対応する
#文字クラスを使用して、ハイフンまたはかっこに対応するようにする

text =<<TEXT
  名前：伊藤淳一
  電話：03(1234)5678
  電話：090-1234-5678
  電話：0795(12)3456
  電話：04992-1-2345
  住所：兵庫県西脇市板波町1-2-3
TEXT

text.scan /\d{2,4}[-()]\d{1,4}[-)]\d{4}/
#=> ["03(1234)5678", "090-1234-5678", "0795(12)3456", "4992-1-2345"]

#[]内のハイフンの使い方は要注意
#ハイフンが[]内の先頭または末尾にある場合は、ハイフンが文字列としてみなされる
#ハイフンが文字と文字の間[a-z]のようにあると、範囲を示しているとみなされる

#ハイフンが間にある場合は、半角数字全てに反応する
text =<<TEXT
  名前：伊藤淳一
  電話：03(1234)5678
  電話：090-1234-5678
  電話：0795(12)3456
  電話：04992-1-2345
  住所：兵庫県西脇市板波町1-2-3
TEXT

text.scan /[0-9]/
  #=> ["0",n /[0-9]/ 
  # "3",
  # "1",
  # "2",
  # "3",
  # "4",
  # "5",
  # "6",
  # "7",
  # "8",
  # "0",
  # "9",
  # "0",
  # "1",
  # "2",
  # "3",
  # "4",
  # "5",
  # "6",
  # "7",
  # "8",
  # "0",
  # "7",
  # "9",
  # "5",
  # "1",
  # "2",
  # "3",
  # "4",
  # "5",
  # "6",
  # "0",
  # "4",
  # "9",
  # "9",
  # "2",
  # "1",
  # "2",
  # "3",
  # "4",
  # "5",
  # "1",
  # "2",
  # "3"]


#ハイフンを先頭に入れると、「0 or 9 or -」になる
text =<<TEXT
  名前：伊藤淳一
  電話：03(1234)5678
  電話：090-1234-5678
  電話：0795(12)3456
  電話：04992-1-2345
  住所：兵庫県西脇市板波町1-2-3
TEXT

text.scan /[-09]/
#=> ["0", "0", "9", "0", "-", "-", "0", "9", "0", "9", "9", "-", "-", "-", "-"]

#カタカナ語の表記ゆれを許容する
text =<<TEXT
  クープバゲットのパンは美味しかった。
  今日はクープ バゲットさんに行きました。
  クープ　バゲットのパンは最高。
  ジャムおじさんのパン、ジャムが入ってた。
  また行きたいです。クープ・バゲット。
  クープ・バケットのパン、売り切れだった（><）
TEXT

text.split(/\n/).grep(/クープ.?バ[ゲケ]ット/)
#=> ["  クープバゲットのパンは美味しかった。", "  今日はクープ バゲットさんに行きました。", "  クープ　バゲットのパンは最高。", "  また行きたいです。クープ・バゲット。", "  クープ・バケットのパン、売り切れだった（><）"]