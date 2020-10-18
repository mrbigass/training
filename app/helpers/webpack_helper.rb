# frozen_string_literal: true

module WebpackHelper
  # Creates a script tag that references the named pack file, as compiled by webpack per the entries list
  # in package/environments/base.js. By default, this list is auto-generated to match everything in
  # app/javascript/packs/*.js. In production mode, the digested reference is automatically looked up.
  #
  # Example:
  #
  #   <%= javascript_pack_tag 'calendar' %> # =>
  #   <script src="/packs/calendar-1016838bab065ae1e314.js" ></script>
  def javascript_pack_tag(*names, **options)
    javascript_include_tag(*sources_from_manifest_entries(names, type: :javascript), **options)
  end

  # Creates a link tag that references the named pack file, as compiled by webpack per the entries list
  # in package/environments/base.js. By default, this list is auto-generated to match everything in
  # app/javascript/packs/*.js. In production mode, the digested reference is automatically looked up.
  #
  # Note: If the development server is running and hot module replacement is active, this will return nothing.
  # In that setup you need to configure your styles to be inlined in your JavaScript for hot reloading.
  #
  # Examples:
  #
  #   # When extract_css is false in webpacker.yml:
  #   <%= stylesheet_pack_tag 'calendar' %> # =>
  #   nil
  #
  #   # When extract_css is true in webpacker.yml:
  #   <%= stylesheet_pack_tag 'calendar' %> # =>
  #   <link rel="stylesheet" media="screen" href="/packs/calendar-1016838bab065ae1e122.css" />
  def stylesheet_pack_tag(*names, **options)
    stylesheet_link_tag(*sources_from_manifest_entries(names, type: :stylesheet), **options)
  end

  private

  MANIFEST_PATH = 'public/packs/manifest.json'

  def sources_from_manifest_entries(names, type:)
    names.map { |name| WebpackManifest.new(MANIFEST_PATH).lookup!(name, type: type) }.flatten
  end
end
