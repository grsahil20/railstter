require 'rails_helper'

RSpec.describe Tweet, type: :model do

	describe 'validations' do
        subject { build(:tweet) }
        it { should validate_presence_of(:content) }
	end

end
