require 'pry'
class Item
  attr_accessor :name, :sell_in, :quality
  ITEMS = {
    'Aged Brie' => :handle_aged_brie,
    'Sulfuras' => :handle_sulfuras,
    'Backstage Passes' => :handle_backstage_passes,
    'Normal' => :handle_normal,
    'Conjured' => :handle_conjured
  }

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end
end

class Normal < Item
  def update_quality
    if quality > 0
      sell_in < 0 ? self.quality -=2 : self.quality -= 1
    end
    self.sell_in -= 1
  end
end

class Sulfuras < Item
  def update_quality
    self.quality
  end
end

class AgedBrie < Item
  def update_quality
    self.quality += 1 if quality < 50
    self.sell_in -= 1
  end
end

class BackstagePass < Item
  def update_quality
    self.quality += 1 if quality < 50
    self.quality += 1 if sell_in < 11
    self.quality += 1 if sell_in < 6
    self.quality = 0 if sell_in < 0
    self.sell_in -= 1 if sell_in > 0
  end
end

class Conjured < Item
  def update_quality
    self.quality -= 2
    self.sell_in -= 1
  end
end
