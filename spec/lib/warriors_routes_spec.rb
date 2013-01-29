require 'spec_helper'

describe WarriorsController, :type => :routing do
  it 'routes to warrior resources' do
    { get: '/warriors' }.should route_to(controller: 'warriors', action: 'index')
    { post: '/warriors' }.should route_to(controller: 'warriors', action: 'create')
    { get: '/warriors/new' }.should route_to(controller: 'warriors', action: 'new')
    { get: '/warriors/1' }.should route_to(controller: 'warriors', action: 'show', id: '1')
    { get: '/warriors/1/edit' }.should route_to(controller: 'warriors', action: 'edit', id: '1')
    { put: '/warriors/1' }.should route_to(controller: 'warriors', action: 'update', id: '1')
    { delete: '/warriors/1' }.should route_to(controller: 'warriors', action: 'destroy', id: '1')
  end
end
