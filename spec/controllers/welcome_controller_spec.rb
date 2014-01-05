require 'spec_helper'

describe WelcomeController do

  describe 'get index page' do
    it 'should be successful' do
      get :index
      expect(response).to be_successful
    end

    it "should have a @body_class of 'welcome'" do
      pending
    end

  end

end
