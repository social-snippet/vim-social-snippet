require "vimrunner"
require "vimrunner/rspec"

Vimrunner::RSpec.configure do |config|
  config.reuse_server = false

  config.start_vim do
    vim = Vimrunner.start
    vim
  end
end

module SpecHelpers

  def enable_social_snippet
    plugin_path = File.expand_path('../..', __FILE__)
    vim.add_plugin(plugin_path, 'plugin/social_snippet.vim')
    vim.command 'call social_snippet#init#ruby()'
  end

  def vim_current_buffer
    vim.command('echomsg join(getline(1, "$"), "\n")').strip
  end

end

RSpec.configure do |config|
  config.include SpecHelpers
end

