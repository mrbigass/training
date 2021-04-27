# frozen_string_literal: true

RSpec.describe RentalReservationForm do
  xdescribe '#Validations' do
    it { is_expected.to validate_presence_of(:office) }
    it { is_expected.to validate_presence_of(:machine_id) }
    it { is_expected.to validate_presence_of(:customer_id) }
  end

  describe '#InstanceMethods' do
    describe '.save' do
      subject { instance.save }

      let(:instance) { described_class.new }
    end
  end
end
