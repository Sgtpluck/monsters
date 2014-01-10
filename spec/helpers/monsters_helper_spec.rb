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

# Hah, success!
describe MonstersHelper do
  
  describe '#fraction' do
    it "num='.125' should return '1/8'" do
      expect(fraction('.125'.to_f)).to eq('1/8')
    end

    it "num='.17' should return '1/6'" do
      expect(fraction('.17'.to_f)).to eq('1/6')
    end

    it "num='.25' should return '1/4'" do
      expect(fraction('.25'.to_f)).to eq('1/4')
    end

    it "num='.33' should return '1/3'" do
      expect(fraction('.33'.to_f)).to eq('1/3')
    end

    it "num='.50' should return '1/2'" do
      expect(fraction('.50'.to_f)).to eq('1/2')
    end

    it 'anything else should return itself' do
      expect(fraction('2')).to eq('2')
    end
  end

end
