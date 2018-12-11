module Gosu
  class Tile
    attr_reader :position, :name

    def initialize(tile_name, tile_pos, attributes = {})
      @name = tile_name
      @position = tile_pos
      @collide = true if attributes["collide"]
    end

    def collide?
      @collide
    end
  end
end
