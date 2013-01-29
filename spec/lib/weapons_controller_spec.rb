require 'spec_helper'

describe WeaponsController, :type => :controller do

  before { Warrior.create.weapons.create }
  let(:warrior) { Warrior.first }
  before { Warrior.stub find: warrior }

  describe 'GET /warriors/:warrior_id/weapons' do
    it 'assigns the parent member vars' do
      get :index, warrior_id: 1
      assigns(:warrior).should == warrior
    end

    it 'assigns the collection var' do
      get :index, warrior_id: 1
      assigns(:weapons).should == warrior.weapons
    end
  end

  describe 'GET /warriors/:warrior_id/weapons/new' do
    it 'fetches a new instance of weapon from last parent' do
      get :new, warrior_id: 1
      assigns(:weapon).warrior.should == warrior
    end
  end

  describe 'DELETE /warriors/:warrior_id/weapons/:id' do
    it 'assigns the member var' do
      weapon = warrior.weapons.first
      Weapon.stub find: weapon
      delete :destroy, warrior_id: 1, id: 1
      assigns(:weapon).should == weapon
    end
  end

end
