module ToyResources::Model

  def collection_symbol
    to_s.pluralize.underscore.to_sym
  end

  def collection_var_name
    "@#{collection_symbol.to_s}"
  end

  def member_symbol
    to_s.underscore.to_sym
  end

  def member_var_name
    "@#{member_symbol}"
  end

  def to_params_symbol
    :"#{member_symbol}"
  end

  def to_params_id_symbol
    :"#{member_symbol}_id"
  end

end

ActiveRecord::Base.extend ToyResources::Model
