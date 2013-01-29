require 'spec_helper'

describe ExperiencesController, :type => :routing do
  it 'routes to experiences resources' do
    { get: '/warriors/1/experience/edit' }.should route_to(controller: 'experiences', action: 'edit', warrior_id: '1')
    { put: '/warriors/1/experience' }.should route_to(controller: 'experiences', action: 'update', warrior_id: '1')
  end
end
