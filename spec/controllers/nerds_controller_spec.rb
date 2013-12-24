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

end
