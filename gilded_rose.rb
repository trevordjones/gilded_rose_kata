require 'pry'
class Item
  attr_accessor :name, :sell_in, :quality, :type
  ITEMS = {
    'Aged Brie' => :handle_aged_brie,
    'Sulfuras' => :handle_sulfuras,
    'Backstage Passes' => :handle_backstage_passes,
    'Normal' => :handle_normal,
    'Conjured' => :handle_conjured
  }

  def initialize(name, sell_in, quality, type)
    @name = name
    @sell_in = sell_in
    @quality = quality
    @type = type
  end

  def update_quality
    self.send(ITEMS[type])
  end

  def handle_aged_brie
    self.quality += 1 if quality < 50
    self.sell_in -= 1
  end

  def handle_backstage_passes
    self.quality += 1 if quality < 50
    self.quality += 1 if sell_in < 11
    self.quality += 1 if sell_in < 6
    self.quality = 0 if sell_in < 0
  end

  def handle_sulfuras
  end

  def handle_conjured
    self.quality -= 2
    self.sell_in -= 1
  end

  def handle_normal
    if quality > 0
      sell_in < 0 ? self.quality -=2 : self.quality -= 1
    end
    self.sell_in -= 1
  end
end
