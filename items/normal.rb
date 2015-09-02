class Normal < Item
  def update_quality
    if quality > 0
      sell_in < 0 ? self.quality -=2 : self.quality -= 1
    end
    self.sell_in -= 1
  end
end
