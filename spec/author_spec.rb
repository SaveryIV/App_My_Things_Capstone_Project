require_relative '../classes/author'
require_relative '../classes/item'
require 'rspec'

describe Author do
  let(:author) { Author.new('John', 'Doe') }
  let(:item1) { Item.new(Date.new(2020, 1, 1)) }
  let(:item2) { Item.new(Date.new(2019, 3, 15)) }

  context 'attributes' do
    it 'has a first name' do
      expect(author.first_name).to eq('John')
    end

    it 'has a last name' do
      expect(author.last_name).to eq('Doe')
    end

    it 'has an ID' do
      expect(author.id).to be_an(Integer)
    end

    it 'has an empty list of items' do
      expect(author.items).to be_empty
    end
  end

  context 'add_item' do
    it 'adds an item to the author' do
      author.add_item(item1)
      expect(author.items).to include(item1)
      expect(item1.author).to eq(author)
    end

    it 'adds multiple items to the author' do
      author.add_item(item1)
      author.add_item(item2)
      expect(author.items).to include(item1, item2)
      expect(item1.author).to eq(author)
      expect(item2.author).to eq(author)
    end
  end
end
