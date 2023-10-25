require 'rspec'
require_relative '../classes/book'

describe Book do
  it 'Should return an instance of Book class' do
    book = Book.new('publisher', 'good', '2011/01/01')
    expect(book).to be_an_instance_of(Book)
  end

  it 'Should not be archived' do
    book = Book.new('publisher', 'good', '2000/01/01')
    expect(book.can_be_archived?).to be_truthy
  end
end
