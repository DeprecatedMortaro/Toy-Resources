require 'spec_helper'

describe WeaponsController, :type => :routing do
  it 'routes to experiences resources' do
    { get: '/warriors/1/weapons' }.should route_to(controller: 'weapons', action: 'index', warrior_id: '1')
    { post: '/warriors/1/weapons' }.should route_to(controller: 'weapons', action: 'create', warrior_id: '1')
    { get: '/warriors/1/weapons/new' }.should route_to(controller: 'weapons', action: 'new', warrior_id: '1')
    { get: '/warriors/1/weapons/1' }.should route_to(controller: 'weapons', action: 'show', warrior_id: '1', id: '1')
    { delete: '/warriors/1/weapons/1' }.should route_to(controller: 'weapons', action: 'destroy', warrior_id: '1', id: '1')
  end
end
