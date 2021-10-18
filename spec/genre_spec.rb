require_relative '../genre'
require_relative '../item'

describe Genre do
  before :each do
    @genre = Genre.new('Gospel')
  end

  describe '#add_item method' do
    it 'should add an item' do
      item = Item.new('youtube', 'Visible', '1920-02-20')
      @genre.add_item(item)
      expect(@genre.items).to include(item)
    end
  end
end