require 'spec_helper'

describe NerdsController do

    describe "GET 'index'" do

    it 'is successful' do
      get :index
      expect(response).to be_successful
    end
  
  end

    describe "GET 'new'" do

      it 'is succesful' do
        get :new
        expect(response).to be_successful
      end

  end

  describe "Make a new nerd" do 

    it "is successful" do
      get :new
      expect(response).to be_successful
    end

    it "saves a nerd that meets validations" do
      get :new
      post 'create', {nerd: {name: 'Davida',
                             email: 'davida@davida.com',
                             password: 'password',
                             password_confirmation: 'password'}}
      expect(response).to redirect_to(:root)
    end

    it "renders the new template if the new nerd doesn't hold up" do
      get :new
      post 'create', {nerd: {name: 'Davida',
                             email: 'davida@davida.com',
                             password: 'password',
                             password_confirmation: 'password1'}}
      expect(response).to render_template(:new)
    end
  
  end # end of 'Make a new nerd'

  # I can't figure out how to call this private method!
  # describe 'private method set_nerd' do

  #   it 'should set the current nerd' do
  #     @nerdo = Nerd.create(name: 'nerdo',
  #                         email: 'nerd@nerds.com',
  #                         password: 'password',
  #                         password_confirmation: 'password')
  #     @nerdo.instance_eval{ set_nerd }
  #     @nerdo.instance_eval{ set_nerd }.should eq(@nerdo)
  #   end
  # end



end
