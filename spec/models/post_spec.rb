# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:user).required }
    it { is_expected.to belong_to(:post).required }
  end
end
