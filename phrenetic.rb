require 'bundler/setup'
Bundler.require(:default)

module Phrenetic
  require_relative 'lib/constants'
  require_relative 'lib/game'
  require_relative 'lib/map'
  require_relative 'lib/window'
  require_relative 'lib/viewport'

  include Constants

  game = Game.new(map: 'test1')

end
