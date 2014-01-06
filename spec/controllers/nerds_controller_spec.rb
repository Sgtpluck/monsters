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

  describe 'Make a new nerd' do

    it is 'successful' do
      get :new
      expect(response).to be_successful
    end

    it 'saves a nerd that meets validations' do
      get :new
      post 'create', { nerd: { name: 'Davida',
                               email: 'davida@davida.com',
                               password: 'password',
                               password_confirmation: 'password' } }
      expect(response).to redirect_to(:root)
    end

    it 'renders the new template if the new nerd does not hold up' do
      get :new
      post 'create', { nerd: { name: 'Davida',
                               email: 'davida@davida.com',
                               password: 'password',
                               password_confirmation: 'password1' } }
      expect(response).to render_template(:new)
    end
  end # end of 'Make a new nerd'

  describe 'update nerds' do

    it 'does update params' do
      nerd = Nerd.create(name: 'davida',
                         email: 'davida@davidamail.com',
                         password: 'password',
                         password_confirmation: 'password')

      patch :update, id: nerd.id, nerd: {
                                        name: 'davida1' }

      expect(response).to redirect_to(:root)
    end

    # it "should render the edit view if the nerd isn't saved" do
    #   nerd = Nerd.create(name: 'davida',
    #                       email: 'davida@nerds.com',
    #                       password: 'password',
    #                       password_confirmation: 'password')
    #   patch :update, id: nerd.id, nerd: {
    #                                    password: '12345678',
    #                                    password_confirmation: '123456789' }
    #   expect(response).to render_template(:edit)
    # end
  end

  describe 'destroy nerds' do
    it 'should destroy a nerd' do
      nerd = Nerd.create(name: 'davida',
                          email: 'davida@nerds.com',
                          password: 'password',
                          password_confirmation: 'password')
      delete :destroy, id: nerd.id

      expect(response).to redirect_to(monsters_path)
    end
  end

end
