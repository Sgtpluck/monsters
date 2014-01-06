require 'spec_helper'

describe Nerd do
  describe 'validations' do
    let(:nerd) { Nerd.new(name: 'Tyler',
                          email: 'tyler@tyler.com',
                          password: 'password',
                          password_confirmation: 'password')
    }

    it 'should have a name' do
      nerd.name = nil
      expect(nerd).to be_invalid
    end

    it 'should have an email' do
      nerd.email = nil
      expect(nerd).to be_invalid
    end

    it 'should have a real email' do
      nerd.email = 'tyler'
      expect(nerd).to be_invalid
      nerd.email = 'tylercom'
      expect(nerd).to be_invalid
      nerd.email = 'tyler.'
      expect(nerd).to be_invalid
    end

    it 'should have a password' do
      nerd.password_digest = nil
      expect(nerd).to be_invalid
    end

    it 'should have a matching password and password_confirmation' do
      nerd.password_confirmation = '12345678'
      expect(nerd).to be_invalid
    end

  end

end
