require_relative '../item'

describe Item do
  before :each do
    @item = Item.new '2010/10/10'
  end

  describe '#can_be_archived?' do
    it 'returns false (by default set as false)' do
      expect(@item.archived).to eql false
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if item was published 10 years ago' do
      @item.move_to_archive
      expect(@item.archived).to eql true
    end
  end
end
