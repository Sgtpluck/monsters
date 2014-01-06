require 'spec_helper'

describe SessionsController do
  describe 'Starting a new session' do

    it 'should redirect you to the root if somone is already signed in' do
      @nerd = Nerd.create(name: 'nerd',
                          email: 'nerd@nerd.com',
                          password: 'password',
                          password_confirmation: 'password')
      session[:nerd_id] = @nerd.id
      get :new
      expect(response).to redirect_to(:root)
    end
  end

end
