# frozen_string_literal: true

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:office).required }
  end
end
