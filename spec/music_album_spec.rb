require_relative '../music_album'


describe MusicAlbum do
  describe '#can_be_archived' do
    context 'The interval between publish_date up to now  is over 10 years and on spotify' do
      item = MusicAlbum.new(true, 'Youtube', 'Invisible', '1929-02-20')
      it 'should return true' do
        expect(item.can_be_archived?).to be(true)
      end
    end

    context 'The interval between publish_date up to now  is over 10 years and not on spotify' do
      item = MusicAlbum.new( false, 'Youtube', 'Invisible', '1929-02-20')
      it 'should return false' do
        expect(item.can_be_archived?).to be_falsey
      end
    end

    context 'The interval between publish_date up to now  is less that 10 years and on spotify' do
      it 'should return false' do
        item =MusicAlbum.new(true, 'Youtube', 'Invisible', '2020-02-20')
        expect(item.can_be_archived?).to be(false)
      end
    end

    context 'The interval between publish_date up to now  is less than 10 years and not on spotify' do
      it 'should return false' do
        item = MusicAlbum.new(false, 'Youtube', 'Invisible', '2020-02-20')
        expect(item.can_be_archived?).to be(false)
      end
    end
  end
end
