require_relative '../book'

describe Book do
  before :each do
    @book = Book.new '2002/02/02', 'ProfPress', 'bad'
  end

  describe '#new' do
    it 'takes three parameters and returns a Book object' do
      expect(@book).to be_an_instance_of(Book)
    end
  end

  describe '#archived' do
    it 'returns false (by default set as false)' do
      expect(@book.archived).to eql false
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if parent\'s method returns true OR if cover_state equals to "bad"' do
      @book.move_to_archive
      expect(@book.archived).to eql true
    end
  end
end
