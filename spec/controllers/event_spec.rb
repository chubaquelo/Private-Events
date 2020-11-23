require 'rails_helper'

RSpec.describe EventController, :type => :controller do
  
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET new" do
    it "has a 200 status code" do
      get :new
      expect(response.status).to eq(200)
    end
  end
  
  describe "GET show" do
    let(:newuser) { User.create(name: 'Name') }
    subject { Event.create(location: 'somewhere', datetime: Time.zone.now, author_id: newuser.id) }
    it "responds to html by default" do
      get :show, :params => { :id => subject.id }
      expect(response.media_type).to eq "text/html"
    end
  end

  # describe "POST create" do
  #   let(:newuser) { User.create(name: 'Name') }
  #   subject {post :create, :params => {:event => {:location => 'somewhere', :datetime: Time.zone.now, :author_id: newuser.id}}}
    
  #   # it "responds to html by default" do
  #   #   post :create, :params => {:event => {:location => 'somewhere', :datetime: Time.zone.now, :author_id: newuser.id}}
  #   #   expect(response.media_type).to eq "text/html"
  #   # end
  # end

end