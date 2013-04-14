# encoding: utf-8
class ApiController < ApplicationController
  def get_type_from_category
    raise unless request.xhr?

    category_id = params["category_id"].to_i
    types = ProductType.where(["category_id = ?", category_id])
    types_hash = {}
    if types.present?
      types.each{|type| types_hash[type.id] = type.name}
    end
    render :partial => "type", :locals => {:types_hash => types_hash.invert}
  end

  def get_state_from_country
    raise unless request.xhr?

    country_id = params["country_id"].to_i
    states = State.where(["country_id = ?", country_id])
    states_hash = {}
    if states.present?
      states.each{|state| states_hash[state.id] = state.name}
    end
    render :partial => "state", :locals => {:states_hash => states_hash.invert}
  end
end
