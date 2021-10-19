require_relative '../game'

describe Game do 
  before :each do
    @game = Game.new '2012/02/02', true, '2018/08/08'
  end

  describe '#new' do
    it 'takes three parameters and returns a Game object' do
      expect(@game).to be_an_instance_of(Game)
    end
  end

  describe '#archived' do
    it 'returns false (by default set as false)' do
      expect(@game.archived).to eql false
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if last_played_at value is older than 2 years' do
      @game.move_to_archive
      expect(@game.archived).to eql true
    end
  end
end

