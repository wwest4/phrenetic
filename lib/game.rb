class Phrenetic::Game
  attr_reader :map

  # Internal: instantiate a Phrenetic game
  #
  # options - a Hash of options:
  #           :map     - the title of the tmx level map
  def initialize(options)

    window    = Phrenetic::Window.new(game:   self,
                                      height: Phrenetic::DEFAULT_WINDOW_HEIGHT,
                                      width:  Phrenetic::DEFAULT_WINDOW_WIDTH)
    @viewport = Phrenetic::Viewport.new
    @map      = Phrenetic::Map.new(name: options[:map], window: window)

    window.show
  end
end