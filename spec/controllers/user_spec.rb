require 'rails_helper'

RSpec.describe UserController, type: :controller do
  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'GET show' do
    subject { User.create(name: 'carlos') }
    it 'responds to html by default' do
      get :show, params: { id: subject.id }
      expect(response.media_type).to eq 'text/html'
    end
  end

  describe 'GET new' do
    it 'responds to html by default' do
      get :new
      expect(response.media_type).to eq 'text/html'
    end
  end

  describe 'POST create' do
    subject { post :create, params: { user: { name: 'whatever name' } } }

    it 'responds to html by default' do
      post :create, params: { user: { name: 'whatever name' } }
      expect(response.media_type).to eq 'text/html'
    end
  end
end
