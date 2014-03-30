class Phrenetic::Game
  # Internal: instantiate a Phrenetic game
  #
  # options - a Hash of options:
  #           :map     - the title of the tmx level map
  def initialize(options)
    window = Phrenetic::Window.new
    map = Map.new(name: options[:map], window: window)

    window.show
  end
end