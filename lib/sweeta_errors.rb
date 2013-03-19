# encoding: utf-8
module  SweetaErrors 
  class SweetaError < StandardError; end

  class NoProductError < SweetaError
    def initialize
      super "お探しの商品が見つかりません。"
    end 
  end
  class NoShopError < SweetaError
    def initialize
      super "お探しの店舗が見つかりません。"
    end 
  end
  class NoUserError < SweetaError
    def initialize
      super "ログインが必要です"
    end 
  end
  class AccessDeniedError < SweetaError
    def initialize
      super "権限がありません"
    end 
  end
end
