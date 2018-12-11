module Gosu
  class Camera
    attr_accessor :zoom

    def initialize(window, width, height, map_pos_x, map_pos_y, x, y, zoom = 1)
      @window = window
      @width = width
      @height = height
      @offset_x = -map_pos_x
      @offset_y = -map_pos_y
      @x = x
      @y = y
      @zoom = zoom
    end

    def draw_sprite(image, x, y)
      x *= @zoom
      y *= @zoom

      Gosu.clip_to(@x, @y, @width, @height) do
        draw_x = x + (@offset_x + @width / 2)
        draw_y = y + (@offset_y + @height / 2)
        image.draw(draw_x, draw_y, 1, @zoom, @zoom)
      end
    end

    def draw
      @window.draw_rect(@x, @y, @width, @height, Gosu::Color::WHITE, 0)
    end

    def update_x(x)
      @offset_x -= x
    end

    def update_y(y)
      @offset_y -= y
    end

    def map_position(x, y)
      @offset_x = x
      @offset_y = y
    end
  end
end
