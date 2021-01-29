require 'rails_helper'

RSpec.describe Thought, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    subject { Thought.create(id: 1, user_id: 1, thought: 'We are testing') }
    it { should validate_presence_of(:thought) }
  end
end
