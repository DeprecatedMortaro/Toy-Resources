require 'spec_helper'

describe WarriorsController, :type => :controller do

  before { Warrior.create }

  context 'GET /warriors' do
    it 'assings collection var' do
      get :index
      assigns(:warriors).should == Warrior.all
    end
  end

  context 'GET /warriors/new' do
    it 'fetches a new instance of warrior' do
      get :new
      assigns(:warrior).should be_new_record
    end

    it 'assigns member var' do
      get :new
      assigns(:warrior).should be_kind_of(Warrior)
    end
  end

  context 'POST /warriors' do
    it "shows warrior after creating" do
      post :create, warrior: {}
      response.should redirect_to(warrior_path(Warrior.last))
    end

    it "creates the warrior and assigns it to a member var" do
      post :create, warrior: {}
      assigns(:warrior).should be_a(Warrior)
      assigns(:warrior).should be_persisted
    end
  end

  context 'GET /warriors/:id' do
    it 'assigns the found warrior to member var' do
      Warrior.stub find: Warrior.first
      get :show, id: 1
      assigns(:warrior).should == Warrior.first
    end
  end

  context 'GET /warriors/:id/edit' do
    it 'assigns the found warrior to member var' do
      Warrior.stub find: Warrior.first
      get :edit, id: 1
      assigns(:warrior).should == Warrior.first
    end
  end

  context 'PUT /warriors/:id' do
    it 'assigns the found warrior to member var' do
      Warrior.stub find: Warrior.first
      put :update, id: 1
      assigns(:warrior).should == Warrior.first
    end

    it 'updates the member var' do
      pending 'must uncomment and refactor'
      #warrior = Warrior.last
      #Warrior.stub find: warrior
      #warrior.stub update_attributes: true
      #put :update, id: 1, warrior: {name: 'someothername'}
      #warrior.should_receive :update_attributes
    end

    it "shows warrior after updating" do
      Warrior.stub find: Warrior.last
      put :update, id: 1, warrior: {name: 'othername'}
      response.should redirect_to(warrior_path(Warrior.last))
    end
  end

  context 'DELETE /warriors/:id' do
    it 'assigns the found warrior to member var' do
      warrior = Warrior.create
      Warrior.stub find: warrior
      delete :destroy, id: 1
      assigns(:warrior).should == warrior
    end
  end

end
