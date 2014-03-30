class Phrenetic::Window < Gosu::Window
  def initialize(width=Phrenetic::DEFAULT_WINDOW_WIDTH, height=Phrenetic::DEFAULT_WINDOW_HEIGHT)
   super width, height, false
   self.caption = Phrenetic::WINDOW_CAPTION + ' ' + Phrenetic::VERSION
  end

  def update
  end

  def draw
  end

  def button_down(id)
    case id
    when Gosu::KbEscape
      close
    end
  end
end
