module ToyResources::Methods

  def self.included base
    base.extend ClassMethods
  end

  def model
    self.class.model
  end

  def vars_list
    instance_variable_get model.member_var_name
  end

  def parents
    []
  end

  module ClassMethods

    def resources *args
      options = args.extract_options!
      actions = {}
      include(singular? ? ToyResources::Singular : ToyResources::Plural)
      nested_to(options[:nested_to])
      actions[:crud] = crud_actions if args.first == :all
      actions[:crud] = crud_actions - options.delete(:except) if options[:except]
      actions[:crud] = options.delete(:only) if options[:only]
      define_actions self, actions, options
    end

    def model
      to_s.gsub('Controller', '').underscore.singularize.camelize.constantize
    end

    protected

    def forward_routes_for actions
      node = ToyResources.routes
      parents_symbols.each { |ps| node = (node[ps] ||= {}) }
      (node[resource_symbol] ||= {}).merge! actions.merge(method: resource_type)
    end

    def define_actions controller, actions, options
      actions[:crud].each { |action| alias_method action, :"_#{action}" } if actions[:crud]
      actions[:member].each { |action| alias_method action, :_show } if actions[:member]
      actions[:collection].each { |action| alias_method action, :_index } if actions[:collection]
      forward_routes_for actions
    end

    def singular?
      parents_symbols.any? && parents_symbols.last.to_s.classify.constantize.reflections[model.member_symbol]
    end

    def nested_to controllers
      return unless controllers
      include ToyResources::Nested
      self.parents_symbols = controllers
    end

    def parents_symbols
      []
    end

  end

end

ActionController::Base.send :include, ToyResources::Methods
