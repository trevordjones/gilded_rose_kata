require 'rspec'
require 'pry'
require 'gilded_rose'

describe '#update_quality' do
  let(:initial_sell_in) { 5 }
  let(:initial_quality) { 10 }
  let(:name) { "Normal Item" }
  let(:type) { 'Normal' }
  let(:item) { Item.new(name, initial_sell_in, initial_quality, type)}
  context 'a regular item' do
    context 'after 1 day' do
      it 'decreases the quality and sell_in by 1' do
        item.update_quality
        expect(item.quality).to eq(initial_quality - 1)
        expect(item.sell_in).to eq(initial_sell_in - 1)
      end
    end
    context 'after sell by date has passed' do
      let(:initial_sell_in) { -1 }
      it 'decreases quality by 2' do
        item.update_quality
        expect(item.quality).to eq(initial_quality - 2)
      end
    end
    context 'once quality has reached zero' do
      let(:initial_quality) { 0 }
      it 'does not get lower than zero' do
        item.update_quality
        expect(item.quality).to eq(initial_quality)
      end
    end
  end
  context 'Aged Brie' do
    let(:type) { 'Aged Brie' }
    context 'after 1 day' do
      it 'increases in quality' do
        item.update_quality
        expect(item.quality).to eq(initial_quality + 1)
      end
      context 'max quality' do
        let(:initial_quality) { 50 }
        it 'does not go above 50' do
          item.update_quality
          expect(item.quality).to eq(initial_quality)
        end
      end
    end
  end
  context 'Sulfuras' do
    let(:type) { 'Sulfuras' }
    let(:initial_sell_in) { -20 }
    it 'never decreases in value' do
      item.update_quality
      expect(item.quality).to eq(initial_quality)
    end
  end
  context 'Backstage Passes' do
    let(:type) { 'Backstage Passes' }
    context '10 days left to sell_in' do
      let(:initial_sell_in) { 10 }
      it 'increases quality by 2' do
        item.update_quality
        expect(item.quality).to eq(initial_quality + 2)
      end
    end
    context '5 days left to sell_in' do
      let(:initial_sell_in) { 5 }
      it 'increases quality by 3' do
        item.update_quality
        expect(item.quality).to eq(initial_quality + 3)
      end
    end
    context 'after sell_in date' do
      let(:initial_sell_in) { -1 }
      it 'drops to zero quality' do
        item.update_quality
        expect(item.quality).to eq(0)
      end
    end
  end
  context 'Conjured' do
    let(:type) {'Conjured'}
    it 'decreases in quality by 2' do
      item.update_quality
      expect(item.quality).to eq(8)
    end
  end
end
