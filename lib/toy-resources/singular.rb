module ToyResources::Singular

  def self.included base
    base.extend ClassMethods
  end

  def extract_member
    member = parents.last.send model.member_symbol
    instance_variable_set model.member_var_name, member
  end

  #to-do
  def extract_build
  #  build = (parents.any? ? parents.last.send(model.collection_symbol) : model).new (params[model.to_params_symbol] || {})
  #  instance_variable_set model.member_var_name, build
  end

  module ClassMethods

    def crud_actions
      [:new, :create, :show, :edit, :update, :destroy]
    end

    def resource_symbol
      model.member_symbol
    end

    def resource_type
      :resource
    end

  end

end
