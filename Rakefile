$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'bundler'
Bundler.require

require 'bubble-wrap/ui'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Magic 8-Ball'
  app.icons << 'icon.png'

  app.files += Dir.glob(File.join(app.project_dir, 'styles/**/*.rb'))
end
