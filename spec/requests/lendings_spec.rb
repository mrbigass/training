# frozen_string_literal: true

RSpec.describe LendingsController, type: :request do
  let(:office) { create(:office) }
  let(:user) { create(:user, office: office) }
  let(:machine) { create(:machine) }

  describe 'GET /lending/new' do
    subject { get '/lendings/new' }

    it do
      subject
      expect(response).to have_http_status(200)
    end
  end
end
