require "gosu/tilemap/version"
require_relative "./tilemap/camera"
require_relative "./tilemap/tile"

module Gosu
  require "psych"

  class TileMap
    attr_reader :width, :height, :board, :tile_size, :tileset, :tiles

    ZORDER = 1

    def initialize(window, map_file)
      load(window, map_file)
    end

    def draw(camera)
      board.each_with_index do |line, y|
        line.each_with_index do |tile_index, x|
          unless tile_index.nil? || tile_index.zero?
            # WTF: - 1 ???
            camera.draw_sprite(@tileset[@tiles[tile_index - 1].position], x * @tile_size, y * @tile_size)
          end
        end
      end
    end

    private

    def load(window, map_file)
      infos = Psych.load_file(map_file)['infos']

      @tile_size = infos['tile_size']
      @height = infos['map'].length
      @width = infos['map'].first.length
      @tileset = Gosu::Image.load_tiles(window, infos['tileset'], @tile_size, @tile_size, false)

      @tiles = []
      infos['tiles'].each do |k, v|
        @tiles << Gosu::Tile.new(k.to_s, v.delete('tile'), v['attributes'])
      end

      @board = infos['map']
    end
  end
end
