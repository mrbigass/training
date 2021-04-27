# frozen_string_literal: true

RSpec.describe LendingsController, type: :request do
  # let(:rspec_session) { { user_id: user.id } }

  let(:office) { create(:office) }
  let(:user) { build(:user, office: office) }
  let(:machine) { create(:machine) }

  xdescribe 'GET /lending/new' do
    subject { get '/lendings/new' }

    it do
      subject
      expect(response).to have_http_status(200)
    end
  end

  xdescribe 'POST /lendings' do
    subject { post '/lendings', params: params }

    let(:params) { {} }

    context do
      it do
        subject
      end
    end
  end
end
