class Phrenetic::Map
  # Internal: load data from a TMX-format level map
  #
  # options - a Hash of options:
  #           :name    - the title of the tmx level map
  #           :window  - the Gosu::window in which this map will be drawn
  def initialize(options)
    map_file  = Phrenetic::MAPS_PATH + '/' + options[:name] + '.tmx'
    @tmx      = Tmx.load map_file
    @tilesets = load_tilesets(options[:window])
    @tiles    = create_tiles
  end

  def draw
    for i in 0..(@tiles.length - 1)
      mx = i % @tmx.width
      my = i / @tmx.width
      wx = (mx * @tmx.tilewidth) + stagger(my)
      wy = (my * @tmx.tileheight/2)
      @tiles[i].draw(wx, wy, 0)
    end
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

  # Internal: using the @tmx data, output an array of type Phrenetic::Map::Tile
  def create_tiles
    # TODO - this only supports the use of layer[0] and tileset[0]; fix.
    @tmx.layers[0].data.map do |tileset_index|
      Phrenetic::Map::Tile.new(@tilesets[0][tileset_index-1])
    end
  end

  def stagger(y)
    odd = (y % 2 != 0)
    odd ? (@tmx.tilewidth / 2) : 0
  end

  class Phrenetic::Map::Tile
    attr_reader(:image)
    # Internal: given a Gosu::Image, create a tile with that image
    #
    # image - a Gosu::Image for the tile
    def initialize(image)
      @image = image
    end

    # Internal: given (x,y,z) coordinates, render a tile
    #
    # x - the x position (from left of screen)
    # y - the x position (from top of screen)
    # z - the layer order (from bottom layer)
    def draw(x, y, z)
      @image.draw(x, y, z)
    end
  end
end