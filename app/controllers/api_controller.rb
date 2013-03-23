# encoding: utf-8
class ApiController < ApplicationController
  def get_type_from_category
#    raise unless request.xhr?
    category_id = params["category_id"].to_i
    types = ProductType.where(["category_id = ?", category_id])
    types_hash = {}
    if types.present?
      types.each{|type| types_hash[type.id] = type.name}
    end
    render :partial => "type", :locals => {:types_hash => types_hash.invert}
  end
end
