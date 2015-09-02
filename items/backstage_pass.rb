class BackstagePass < Item
  def update_quality
    self.quality += 1 if quality < 50
    self.quality += 1 if sell_in < 11
    self.quality += 1 if sell_in < 6
    self.quality = 0 if sell_in < 0
    self.sell_in -= 1 if sell_in > 0
  end
end
