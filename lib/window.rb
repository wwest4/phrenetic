class Phrenetic::Window < Gosu::Window
  # Internal: given a game, a width, and a height,
  # initializes a window of the given dimensions
  # attached to the specified game
  #
  # options - a Hash of options:
  #           :game   - a Phrenetic::Game instance
  #           :height - the desired window height in px
  #           :width  - the desired window width in px
  def initialize(options)
    @game = options[:game]
    super options[:width], options[:height], false
    self.caption = Phrenetic::WINDOW_CAPTION + ' ' + Phrenetic::VERSION
  end

  def update
  end

  def draw
    @game.map.draw
  end

  def button_down(id)
    case id
    when Gosu::KbEscape
      close
    end
  end
end
