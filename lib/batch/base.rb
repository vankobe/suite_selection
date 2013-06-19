# encoding: utf-8
class Batch::Base
  class << self
    def type_selecter(title)
      case
      when title =~ /(アイスクリーム|グラス|ソルベ)/
        type_name = "アイスクリーム"
      when title =~ /タルトグラッセ/
        type_name = "クッキーアイス"
      when title =~ /(トリュフ|ゴールド|グランプラス|ラッピング|ボワットゥ|クリスタルクール)/
        type_name = "トリュフ"
      when title =~ /(カレ|パレ)/
        type_name = "カレ"
      when title =~ /(アマンド|プティ パレ|Go-Hô-Bi|トゥ パック)/
        type_name = "コーティング"
      when title =~ /(タブレット|ミュージカル)/
        type_name = "タブレット"
      when title =~ /(ミントスティック|オランジェ)/
        type_name = "グルマンディ"
      when title =~ /(カーブ|カーヴ|バロリュクス)/
        type_name = "ボンボンショコラ"
      when title =~ /(クッキー|サブレ|デリス ドゥ)/
        type_name = "クッキー"
      when title =~ /ビスキュイ/
        type_name = "ビスキュイ"
      when title =~ /(コンフィチュール|タルティネ|ヴィドゥレーブ)/
        type_name = "コンフィチュール"
      when title =~ /(パリ－トウキョウ|マフォリ)/
        type_name = "マドレーヌ・フィナンシェ"
      when title =~ /キャラメル/
        type_name = "キャラメル"
      when title =~ /ドゥ フリュイ/
        type_name = "ゼリー"
      end
      type_name
    end
  end
end
