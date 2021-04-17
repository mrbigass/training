# frozen_string_literal: true

RSpec.describe Office, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:users) }
    it { is_expected.to have_many(:machines) }
  end
end
