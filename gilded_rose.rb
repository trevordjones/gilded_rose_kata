require 'pry'
ITEMS = {
  'Aged Brie' => :handle_aged_brie,
  'Sulfuras' => :handle_sulfuras,
  'Backstage Passes' => :handle_backstage_passes,
  'Normal Item' => :handle_normal,
  'Conjured' => :handle_conjured
}

def update_quality(items)
  items.each do |item|
    self.send(ITEMS[item.name], item)
  end
end

def handle_aged_brie(item)
  item.quality += 1 if item.quality < 50
  item.sell_in -= 1
end

def handle_backstage_passes(item)
  item.quality += 1 if item.quality < 50
  item.quality += 1 if item.sell_in < 11
  item.quality += 1 if item.sell_in < 6
  item.quality = 0 if item.sell_in < 0
end

def handle_sulfuras(item)
end

def handle_conjured(item)
  item.quality -= 2
  item.sell_in -= 1
end

def handle_normal(item)
  if item.quality > 0
    item.sell_in < 0 ? item.quality -=2 : item.quality -= 1
  end
  item.sell_in -= 1
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]
