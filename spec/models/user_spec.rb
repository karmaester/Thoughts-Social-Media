require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:thoughts) }

  describe 'validations' do
    subject { User.create(id: 1, name: 'TEST') }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:username) }
  end
end
