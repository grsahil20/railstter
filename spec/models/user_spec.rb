require 'rails_helper'

RSpec.describe User, type: :model do

	describe 'validations' do
    subject { build(:user) }
    it { should validate_presence_of(:full_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:username) }
	end

end
