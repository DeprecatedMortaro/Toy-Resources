module ToyResources::Router

  def toy_resources
    Dir["#{Rails.root}/app/controllers/*.rb"].each { |file| load file }
    eval string_block_from ToyResources.routes
    ToyResources.routes = {}
  end

  def string_block_from routes
    routes.map do |model, options|
      <<-BLOCK
        #{options.delete(:method)}(:#{model}, only: #{options.delete(:crud).inspect}) do
          #{string_block_from(options)}
        end
      BLOCK
    end.join
  end

end

ActionDispatch::Routing::Mapper.send :include, ToyResources::Router
