require "gosu"
require_relative "../lib/gosu/tilemap"

class Game < Gosu::Window
  def initialize
    super(1200, 900)
    self.caption = "Gosu tilemap showcase"

    map_path = "./examples/assets/map.yml"
    @map = Gosu::TileMap.new(self, map_path)
    @camera = Gosu::Camera.new(self, 600, 450, 250, 250, 50, 50, 2)
  end

  def update
    self.close if button_down? Gosu::Button::KbEscape
    @camera.update_x(1) if self.button_down? Gosu::Button::KbD
    @camera.update_x(-1) if self.button_down? Gosu::Button::KbQ
    @camera.zoom += 0.1 if self.button_down? Gosu::Button::KbP
    @camera.zoom -= 0.1 if self.button_down? Gosu::Button::KbM
  end

  def draw
    @map.draw(@camera)
    @camera.draw
  end
end

Game.new.show
