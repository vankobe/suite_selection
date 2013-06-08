# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# カテゴリーとタイプ
ProductCategory.create({:name => "チョコレート"})
ProductType.create({:category_id => 1, :name => "トリュフ"})
ProductType.create({:category_id => 1, :name => "タブレット"})
ProductType.create({:category_id => 1, :name => "ビスキュイ"})
ProductType.create({:category_id => 1, :name => "ボンボンショコラ"})
ProductType.create({:category_id => 1, :name => "グルマンディ"})
ProductType.create({:category_id => 1, :name => "カレ"})
ProductCategory.create({:name => "ケーキ"})
ProductType.create({:category_id => 2, :name => "ショートケーキ"})
ProductType.create({:category_id => 2, :name => "ロールケーキ"})
ProductType.create({:category_id => 2, :name => "タルト"})
ProductType.create({:category_id => 2, :name => "チョコレートケーキ"})
ProductType.create({:category_id => 2, :name => "チーズケーキ"})
ProductType.create({:category_id => 2, :name => "ムースケーキ"})
ProductType.create({:category_id => 2, :name => "モンブラン"})
ProductType.create({:category_id => 2, :name => "ミルクレープ"})
ProductCategory.create({:name => "焼き菓子"})
ProductType.create({:category_id => 3, :name => "クッキー"})
ProductType.create({:category_id => 3, :name => "マカロン"})
ProductType.create({:category_id => 3, :name => "バウムクーヘン"})
ProductType.create({:category_id => 3, :name => "カステラ"})
ProductType.create({:category_id => 3, :name => "パンケーキ"})
ProductType.create({:category_id => 3, :name => "パイ"})
ProductCategory.create({:name => "アイス"})
ProductType.create({:category_id => 4, :name => "アイスクリーム"})
ProductType.create({:category_id => 4, :name => "クッキーアイス"})
ProductCategory.create({:name => "キャンディー"})
ProductType.create({:category_id => 5, :name => "キャンディー"})
ProductType.create({:category_id => 5, :name => "ソフトキャンディー"})
ProductType.create({:category_id => 5, :name => "キャラメル"})
ProductCategory.create({:name => "和菓子"})
ProductType.create({:category_id => 6, :name => "だんご"})
ProductType.create({:category_id => 6, :name => "まんじゅう"})
ProductType.create({:category_id => 6, :name => "せんべい・あられ"})
ProductCategory.create({:name => "プリン"})
ProductType.create({:category_id => 7, :name => "プリン"})
ProductCategory.create({:name => "ゼリー"})
ProductType.create({:category_id => 8, :name => "ゼリー"})

# フレーバー
Flavor.create([
{:name => "チョコレート"},
{:name => "オレンジ"},
{:name => "カシス"},
{:name => "ピーチ"},
{:name => "バナナ"},
{:name => "アップル"},
{:name => "グレープ"},
{:name => "マロン"},
{:name => "ラズベリー"},
{:name => "ストロベリー"},
{:name => "なし"},
{:name => "ヘーゼルナッツ"},
{:name => "アーモンド"},
{:name => "マカダミアナッツ"},
{:name => "すもも"},
{:name => "さくら"},
{:name => "うめ"},
{:name => "マンゴー"},
])

# 国名
Country.create([
{:name_ja => "日本", :name_en => "JP"},
{:name_ja => "アメリカ", :name_en => "USA"},
{:name_ja => "フランス", :name_en => "FR"}
])

# 県名
State.create([
{ :country_id => 1, :name => '北海道', :code => 'Hokkaido'},
{ :country_id => 1, :name => '青森県', :code => 'Aomori'},
{ :country_id => 1, :name => '岩手県', :code => 'Iwate'},
{ :country_id => 1, :name => '宮城県', :code => 'Miyagi'},
{ :country_id => 1, :name => '秋田県', :code => 'Akita'},
{ :country_id => 1, :name => '山形県', :code => 'Yamagata'},
{ :country_id => 1, :name => '福島県', :code => 'Fukushima'},
{ :country_id => 1, :name => '茨城県', :code => 'Ibaraki'},
{ :country_id => 1, :name => '栃木県', :code => 'Tochigi'},
{ :country_id => 1, :name => '群馬県', :code => 'Gunma'},
{ :country_id => 1, :name => '埼玉県', :code => 'Saitama'},
{ :country_id => 1, :name => '千葉県', :code => 'Chiba'},
{ :country_id => 1, :name => '東京都', :code => 'Tokyo'},
{ :country_id => 1, :name => '神奈川県', :code => 'Kanagawa'},
{ :country_id => 1, :name => '新潟県', :code => 'Niigata'},
{ :country_id => 1, :name => '富山県', :code => 'Toyama'},
{ :country_id => 1, :name => '石川県', :code => 'Ishikawa'},
{ :country_id => 1, :name => '福井県', :code => 'Fukui'},
{ :country_id => 1, :name => '山梨県', :code => 'Yamanashi'},
{ :country_id => 1, :name => '長野県', :code => 'Nagano'},
{ :country_id => 1, :name => '岐阜県', :code => 'Gifu'},
{ :country_id => 1, :name => '静岡県', :code => 'Shizuoka'},
{ :country_id => 1, :name => '愛知県', :code => 'Aichi'},
{ :country_id => 1, :name => '三重県', :code => 'Mie'},
{ :country_id => 1, :name => '滋賀県', :code => 'Shiga'},
{ :country_id => 1, :name => '京都府', :code => 'Kyoto'},
{ :country_id => 1, :name => '大阪府', :code => 'Osaka'},
{ :country_id => 1, :name => '兵庫県', :code => 'Hyogo'},
{ :country_id => 1, :name => '奈良県', :code => 'Nara'},
{ :country_id => 1, :name => '和歌山県', :code => 'Wakayama'},
{ :country_id => 1, :name => '鳥取県', :code => 'Tottori'},
{ :country_id => 1, :name => '島根県', :code => 'Shimane'},
{ :country_id => 1, :name => '岡山県', :code => 'Okayama'},
{ :country_id => 1, :name => '広島県', :code => 'Hiroshima'},
{ :country_id => 1, :name => '山口県', :code => 'Yamaguchi'},
{ :country_id => 1, :name => '徳島県', :code => 'Tokushima'},
{ :country_id => 1, :name => '香川県', :code => 'Kagawa'},
{ :country_id => 1, :name => '愛媛県', :code => 'Ehime'},
{ :country_id => 1, :name => '高知県', :code => 'Kochi'},
{ :country_id => 1, :name => '福岡県', :code => 'Fukuoka'},
{ :country_id => 1, :name => '佐賀県', :code => 'Saga'},
{ :country_id => 1, :name => '長崎県', :code => 'Nagasaki'},
{ :country_id => 1, :name => '熊本県', :code => 'Kumamoto'},
{ :country_id => 1, :name => '大分県', :code => 'Oita'},
{ :country_id => 1, :name => '宮崎県', :code => 'Miyazaki'},
{ :country_id => 1, :name => '鹿児島県', :code => 'Kagoshima'},
{ :country_id => 1, :name => '沖縄県', :code => 'Okinawa'},
{ :country_id => 2, :name =>  'Alabama', :code => 'AL'},
{ :country_id => 2, :name =>  'Alaska', :code => 'AK'},
{ :country_id => 2, :name =>  'Arizona', :code => 'AZ'},
{ :country_id => 2, :name =>  'Arkansas', :code => 'AR'},
{ :country_id => 2, :name =>  'California', :code => 'CA'},
{ :country_id => 2, :name =>  'Colorado', :code => 'CO'},
{ :country_id => 2, :name =>  'Connecticut', :code => 'CT'},
{ :country_id => 2, :name =>  'Delaware', :code => 'DE'},
{ :country_id => 2, :name =>  'Florida', :code => 'FL'},
{ :country_id => 2, :name =>  'Georgia', :code => 'GA'},
{ :country_id => 2, :name =>  'Hawaiʻi', :code => 'HI'},
{ :country_id => 2, :name =>  'Idaho', :code => 'ID'},
{ :country_id => 2, :name =>  'Illinois', :code => 'IL'},
{ :country_id => 2, :name =>  'Indiana', :code => 'IN'},
{ :country_id => 2, :name =>  'Iowa', :code => 'IA'},
{ :country_id => 2, :name =>  'Kansas', :code => 'KS'},
{ :country_id => 2, :name =>  'Kentucky', :code => 'KY'},
{ :country_id => 2, :name =>  'Louisiana', :code => 'LA'},
{ :country_id => 2, :name =>  'Maine', :code => 'ME'},
{ :country_id => 2, :name =>  'Maryland', :code => 'MD'},
{ :country_id => 2, :name =>  'Massachusetts', :code => 'MA'},
{ :country_id => 2, :name =>  'Michigan', :code => 'MI'},
{ :country_id => 2, :name =>  'Minnesota', :code => 'MN'},
{ :country_id => 2, :name =>  'Mississippi', :code => 'MS'},
{ :country_id => 2, :name =>  'Missouri', :code => 'MO'},
{ :country_id => 2, :name =>  'Montana', :code => 'MT'},
{ :country_id => 2, :name =>  'Nebraska', :code => 'NE'},
{ :country_id => 2, :name =>  'Nevada', :code => 'NV'},
{ :country_id => 2, :name =>  'New Hampshire', :code => 'NH'},
{ :country_id => 2, :name =>  'New Jersey', :code => 'NJ'},
{ :country_id => 2, :name =>  'New Mexico', :code => 'NM'},
{ :country_id => 2, :name =>  'New York', :code => 'NY'},
{ :country_id => 2, :name =>  'North Carolina', :code => 'NC'},
{ :country_id => 2, :name =>  'North Dakota', :code => 'ND'},
{ :country_id => 2, :name =>  'Ohio', :code => 'OH'},
{ :country_id => 2, :name =>  'Oklahoma', :code => 'OK'},
{ :country_id => 2, :name =>  'Oregon', :code => 'OR'},
{ :country_id => 2, :name =>  'Pennsylvania', :code => 'PA'},
{ :country_id => 2, :name =>  'Rhode Island', :code => 'RI'},
{ :country_id => 2, :name =>  'South Carolina', :code => 'SC'},
{ :country_id => 2, :name =>  'South Dakota', :code => 'SD'},
{ :country_id => 2, :name =>  'Tennessee', :code => 'TN'},
{ :country_id => 2, :name =>  'Texas', :code => 'TX'},
{ :country_id => 2, :name =>  'Utah', :code => 'UT'},
{ :country_id => 2, :name =>  'Vermont', :code => 'VT'},
{ :country_id => 2, :name =>  'Virginia', :code => 'VA'},
{ :country_id => 2, :name =>  'Washington', :code => 'WA'},
{ :country_id => 2, :name =>  'West Virginia', :code => 'WV'},
{ :country_id => 2, :name =>  'Wisconsin', :code => 'WI'}
])
AdminUser.create(
{:login_name => "e7f84669e6a30d118a4a2ac93a98312f8e1f2d31c208351c434fad3955fd0e04", :password => "58cb0468678c88b559823c8e3561983954b9c41a065f0a1b727b30aaa05a70e0"}
)
