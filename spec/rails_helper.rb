# frozen_string_literal: true

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'shoulda/matchers'

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

# マッチャーやマクロなどの個人のカスタムはspec/supportに置くこと
# ただし、ファイル名は*_spec.rbにしないこと
# また、多数のファイルで読み込まれるようであれば以下をコメントアウト
# することで読み込み時間を短くできる
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# テスト前にDBを初期化する
begin
  system 'bundle exec ridgepole -c config/database.yml --env test --apply'
rescue RuntimeError => e
  puts 'failed in migration'
  puts e.full_message
  exit 1
end
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  # 独立環境で実行されてほしいのでトランザクションを張る
  config.use_transactional_fixtures = true

  # https://relishapp.com/rspec/rspec-rails/docs
  # type指定の話
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

  config.before(:each) do
    session = defined?(rspec_session) ? rspec_session : {}

    # destroyメソッドを実行してもエラーにならないようにします（必要であれば）
    # session.class_eval { def destroy; nil; end }

    # sessionメソッドを上書き
    allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(session)
  end
end
