require 'sprockets'

File.delete("javascripts/application.js")

secretary = Sprockets::Secretary.new(
  :asset_root   => ".",
  :load_path    => ["javascripts/lib/", "javascripts/lib/*"],
  :source_files => ["javascripts/lib/*.js", "javascripts/lib/**/*.js", "javascripts/*.js"]
)

# Generate a Sprockets::Concatenation object from the source files
concatenation = secretary.concatenation
# Write the concatenation to disk
concatenation.save_to("javascripts/application.js")

# Install provided assets into the asset root
secretary.install_assets
