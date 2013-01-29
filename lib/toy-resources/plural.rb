module ToyResources::Plural

  def self.included base
    base.extend ClassMethods
  end

  def extract_collection
    collection = (parents.any? ? parents.last.send(model.collection_symbol) : model).all
    instance_variable_set model.collection_var_name, collection
  end

  def extract_member
    member = (parents.any? ? parents.last.send(model.collection_symbol) : model).find params[:id]
    instance_variable_set model.member_var_name, member
  end

  def extract_build
    build = (parents.any? ? parents.last.send(model.collection_symbol) : model).new (params[model.to_params_symbol] || {})
    instance_variable_set model.member_var_name, build
  end

  module ClassMethods

    def crud_actions
      [:index, :new, :create, :show, :edit, :update, :destroy]
    end

    def resource_symbol
      model.collection_symbol
    end

    def resource_type
      :resources
    end

  end

end
