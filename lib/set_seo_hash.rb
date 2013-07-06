module SetSeoHash
  def self.included(base)
    base.send(:include, SeoSearch)
    base.send(:include, SeoProducts)
  end

  private

  def set_seo_word(options={})
    controller_path = options[:controller_path]
    action_name = options[:action_name]
    m = ("seo_" + controller_path + "_" + action_name).gsub(/\//, "_")
    self.send(m, options)
  end
end
