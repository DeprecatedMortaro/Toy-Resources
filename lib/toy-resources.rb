module ToyResources
  mattr_accessor :routes
  ToyResources.routes = {}
end

require 'action_controller'
require 'active_record'

require 'toy-resources/router'
require 'toy-resources/model'
require 'toy-resources/actions'
require 'toy-resources/methods'
require 'toy-resources/nested'
require 'toy-resources/plural'
require 'toy-resources/singular'
