class AgedBrie < Item
  def update_quality
    self.quality += 1 if quality < 50
    self.sell_in -= 1
  end
end
