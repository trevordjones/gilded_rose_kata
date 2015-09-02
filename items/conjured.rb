class Conjured < Item
  def update_quality
    self.quality -= 2
    self.sell_in -= 1
  end
end
