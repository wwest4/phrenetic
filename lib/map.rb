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

  # Internal: given an array of Gosu::Tileset, output an array
  # of arrays of type Gosu::Image
  #
  # window - the Gosu::Window in which these tiles will be drawn
  def load_tilesets(window)
    @tmx.tilesets.map { |tileset| load_images(window, tileset) }
  end

  # Internal: given a tileset, output an array of type Gosu::Image
  #
  # window  - the Gosu::Window in which these tiles will be drawn
  # tileset - a Gosu::Tileset
  def load_images(window, tileset)
    source      = Phrenetic::MAPS_PATH + '/' + tileset.image
    tile_width  = tileset.tilewidth
    tile_height = tileset.tileheight
    tileable    = true
    Gosu::Image.load_tiles(window, source, tile_width, tile_height, tileable)
  end
end