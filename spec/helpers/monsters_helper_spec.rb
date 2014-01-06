require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the MonstersHelper. For example:
#
# describe MonstersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

# I could not get this to work. :(
describe MonstersHelper do
  
  describe '#fraction' do
    it "num='.125' should return '1/8'" do
      pending num = '.125'
      expect(helper.fraction(num)).to eq('1/8')
    end

    it "num='.17' should return '1/6'" do
    end

    it "num='.25' should return '1/4'" do
    end

    it "num='.33' should return '1/3'" do
    end

    it "num='.50' should return '1/2'" do
    end

    it 'anything else should return itself' do
    end
  end

end
