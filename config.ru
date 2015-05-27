require 'bundler'
Bundler.require

sprockets = Sprockets::Environment.new.tap do |s|
  s.register_engine '.haml', Tilt::HamlTemplate
  s.register_engine '.rb', Opal::Processor

  s.append_path 'app'
  s.append_path 'views'
  s.append_path 'styles'

  Opal.paths.each do |p|
    s.append_path p
  end

  RailsAssets.load_paths.each do |p|
    s.append_path p
  end
end

Opal::Processor.source_map_enabled = false

map '/' do
  run sprockets
end

