# encoding: utf-8
module SetSeoHash
  module SeoSearch
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

    def seo_search_products(options)
      title = '商品一覧 [Sweeta]'
      description = "商品の一覧ページです"
      keywords = "お菓子,スイーツ,お土産,プレゼント"
      h1 = "商品一覧ページ"
      return_seo_hash(title, description, keywords, h1)
    end
  end
end
