require_relative '../source'
require_relative '../game'

describe Source do
  before :each do
    @source = Source.new 'Online shop'
    @game = Game.new '2012/02/02', true, '2018/08/08'
  end

  describe '#new' do
    it 'takes one parameter and returns a Source object' do
      expect(@source).to be_an_instance_of(Source)
    end
  end

  describe '#add_game' do
    it 'check newly added item' do
      @source.add_item @game
      expect(@source.items).to include(@game)
    end
  end
end
