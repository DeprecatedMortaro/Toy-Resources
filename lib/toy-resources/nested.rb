module ToyResources::Nested

  def self.included base
    base.extend ClassMethods
  end

  def parents
    self.class.parents_symbols.map do |symbol|
      model = symbol.to_s.classify.constantize
      member = model.find params[model.to_params_id_symbol]
      instance_variable_set model.member_var_name, member
      member
    end
  end

  def vars_list
    parents << instance_variable_get(model.member_var_name)
  end

  module ClassMethods
    attr_accessor :parents_symbols
  end

end
