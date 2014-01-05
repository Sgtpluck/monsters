require 'spec_helper'

describe Monster do
  describe 'validations' do

    let (:monster) {Monster.new(name: 'Davida', type: 'humanoid', description: 'scarier than she looks', cr: 10, environment: 'the moon', exp: 10000 )}

    it 'must have a name' do
      monster.name = nil
      expect(monster).to be_invalid
    end
  
    it 'must have a type' do
      monster.type = nil
      expect(monster).to be_invalid
    end

    it 'must have a description' do
      monster.description = nil
      expect(monster).to be_invalid
    end

    it 'must have an cr number to set level' do
      monster.cr = nil
      expect(monster).to be_invalid
    end

    it 'must have an cr number greater than 1' do
      monster.cr = 0
      expect(monster).to be_invalid
    end

    it 'must have a preferred environment' do
      monster.environment = nil
      expect(monster).to be_invalid
    end

    it 'must have an exp' do
      monster.exp = nil
      expect(monster).to be_invalid
    end

    it 'must have an exp of at least 50' do
      monster.exp = 49
      expect(monster).to be_invalid
    end
  
  end # Closing validations

  describe 'self.find_monsters' do
  end


end
