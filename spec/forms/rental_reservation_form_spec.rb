# frozen_string_literal: true

RSpec.describe RentalReservationForm do
  describe '#Validations' do
    it { is_expected.to validate_presence_of(:office) }
    it { is_expected.to validate_presence_of(:machine_id) }
    it { is_expected.to validate_presence_of(:customer_id) }
  end

  describe '#InstanceMethods' do
    describe '.save' do
      subject { instance.save }

      let(:office) { create(:office) }
      let(:machine) { create(:machine) }
      let(:customer) { create(:customer) }
      let(:from) { Time.zone.now }
      let(:to) { Time.zone.now + 2.weeks }
      let(:instance) { described_class.new(**form_params) }

      context 'パラメータが渡された時' do
        let(:form_params) do
          {
            office: office,
            customer_id: customer.id,
            machine_id: machine.id,
            from: from,
            to: to
          }
        end

        it { is_expected.to be true }
      end

      context 'パラメータの中身がない時' do
        let(:form_params) { {} }
        it do
          is_expected.to be false
          expect(instance.errors.values.count).to be 3
        end
      end

      context '貸し出し日前に返却日が設定された場合' do
        let(:form_params) do
          {
            office: office,
            customer_id: customer.id,
            machine_id: machine.id,
            from: to,
            to: from
          }
        end

        it do
          is_expected.to be false
        end
      end
    end
  end
end
