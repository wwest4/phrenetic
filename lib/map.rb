class Map
  # Internal: load data from a TMX-format level map
  #
  # options - a Hash of options:
  #           :name    - the title of the tmx level map
  #           :window  - the Gosu::window in which this map will be drawn
  def initialize(options)
    map_file = Phrenetic::MAPS_PATH + '/' + options[:name] + '.tmx'
    @tmx = Tmx.load map_file
    @tilesets = load_tilesets(options[:window])
  end

  private

  # Internal: read in tileset image(s) and output array(s) of Gosu images
  #
  # window - the Gosu::Window in which these tiles will be drawn
  def load_tilesets(window)
    @tmx.tilesets.each do
      #load_tiles(window, source, tile_width, tile_height, tileable)
    end
  end
end