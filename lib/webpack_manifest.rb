# frozen_string_literal: true

# Singleton registry for accessing the packs path using a generated manifest.
# This allows javascript_pack_tag, stylesheet_pack_tag, asset_pack_path to take a reference to,
# say, "calendar.js" or "calendar.css" and turn it into "/packs/calendar-1016838bab065ae1e314.js" or
# "/packs/calendar-1016838bab065ae1e314.css".
#
# When the configuration is set to on-demand compilation, with the `compile: true` option in
# the webpacker.yml file, any lookups will be preceded by a compilation if one is needed.
class WebpackManifest
  class MissingEntryError < StandardError; end

  def initialize(path)
    @path = path
  end

  def refresh
    @data = load
  end

  # Computes the relative path for a given Webpacker asset using manifest.json.
  # If no asset is found, returns nil.
  #
  # Example:
  #
  #   Webpacker.manifest.lookup('calendar.js') # => "/packs/calendar-1016838bab065ae1e122.js"
  def lookup(name, pack_type = {})
    find(full_pack_name(name, pack_type[:type]))
  end

  # Like lookup, except that if no asset is found, raises a Webpacker::Manifest::MissingEntryError.
  def lookup!(name, pack_type = {})
    lookup(name, pack_type) || handle_missing_entry(name, pack_type)
  end

  private

  def data
    @data ||= load
    # if config.cache_manifest?
    #   @data ||= load
    # else
    #   refresh
    # end
  end

  def find(name)
    data[name.to_s].presence
  end

  def full_pack_name(name, pack_type)
    return name unless File.extname(name.to_s).empty?

    "#{name}.#{manifest_type(pack_type)}"
  end

  def handle_missing_entry(name, pack_type)
    raise Webpack::Manifest::MissingEntryError, missing_file_from_manifest_error(full_pack_name(name, pack_type[:type]))
  end

  def load
    if File.exist?(@path)
      JSON.parse File.read(@path)
    else
      {}
    end
  end

  # The `manifest_name` method strips of the file extension of the name, because in the
  # manifest hash the entrypoints are defined by their pack name without the extension.
  # When the user provides a name with a file extension, we want to try to strip it off.
  def manifest_name(name, pack_type)
    return name if File.extname(name.to_s).empty?

    File.basename(name, pack_type)
  end

  def manifest_type(pack_type)
    case pack_type
    when :javascript then 'js'
    when :stylesheet then 'css'
    else pack_type.to_s
    end
  end

  def missing_file_from_manifest_error(bundle_name)
    <<~MSG
      Webpacker can't find #{bundle_name} in #{config.public_manifest_path}. Possible causes:
      1. You want to set webpacker.yml value of compile to true for your environment
         unless you are using the `webpack -w` or the webpack-dev-server.
      2. webpack has not yet re-run to reflect updates.
      3. You have misconfigured Webpacker's config/webpacker.yml file.
      4. Your webpack configuration is not creating a manifest.
      Your manifest contains:
      #{JSON.pretty_generate(@data)}
    MSG
  end
end
