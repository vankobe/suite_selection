class FlavorFix
  class << self
    def process
      product_contents = ProductContent.all
      product_contents.each do |product_content|
	product_content.flavor_name = product_content.flavor.try(:name)
	product_content.save
      end
    end
  end
end
FlavorFix.process
