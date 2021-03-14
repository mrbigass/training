# frozen_string_literal: true

RSpec.describe UserAuthentications do
  xdescribe '#authenticate' do
    subject { authenticate(email, password) }

    context '正常なリクエスト' do
      let(:email) { 'text@example.com' }
      let(:password) { 'password' }

      it '' do
        is_expected.to be_nil
      end
    end
  end

  xdescribe '#check_authentication' do
  end
end
