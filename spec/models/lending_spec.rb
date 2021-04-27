# frozen_string_literal: true

RSpec.describe Lending, type: :model do
  describe '#Validation' do
    it { is_expected.to validate_presence_of(:office) }
    it { is_expected.to validate_presence_of(:machine) }
    it { is_expected.to validate_presence_of(:customer) }

    xdescribe 'not_return_before_lend' do
    end
  end
end
