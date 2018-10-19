module Gosu
  class Tile
    attr_reader :position, :name

    def initialize(tile_name, tile_pos, options = {})
      @name = tile_name
      @position = tile_pos
    end
  end
end
