# encoding: utf-8
module SetSeoHash
  module SeoShops
    private
    def return_seo_hash(title, description, keywords, h1, options = {})
      seo_hash = {}
      seo_hash[:title] = title    
      seo_hash[:description] = description    
      seo_hash[:keywords] = keywords    
      seo_hash[:h1] = h1    
      if options[:link].present?
        seo_hash[:link] = {}
        seo_hash[:link][:start] = options[:link][:start]
        seo_hash[:link][:prev] = options[:link][:prev]
        seo_hash[:link][:next] = options[:link][:next]
      end
      seo_hash
    end

    def seo_shops_show(options)
      shop_name  = options[:shop].try(:name) 
      title = "#{shop_name} 店舗詳細 [Sweeta]"
      description = "#{shop_name}の店舗詳細ページです"
      keywords = "#{shop_name}、お菓子,スイーツ,お土産,プレゼント"
      h1 = "#{shop_name} 店舗詳細"
      return_seo_hash(title, description, keywords, h1)
    end
  end
end
