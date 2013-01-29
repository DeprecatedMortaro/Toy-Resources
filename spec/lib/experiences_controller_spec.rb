require 'spec_helper'

describe ExperiencesController, :type => :controller do

  before { Warrior.create.build_experience }
  let(:warrior) { Warrior.first }
  before { Warrior.stub find: warrior }

  describe 'GET /warriors/:warrior_id/experience' do
    it 'assigns the parent member vars' do
      get :edit, warrior_id: 1
      assigns(:warrior).should == warrior
    end

    it 'assigns the member var' do
      get :edit, warrior_id: 1
      assigns(:experience).should == warrior.experience
    end
  end

end
