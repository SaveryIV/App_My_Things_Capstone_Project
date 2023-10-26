require 'rspec'
require_relative '../classes/label'
require_relative '../classes/item'

describe Label do
    it 'Should return an instance of a Label class' do
      label = Label.new('Twitter', 'blue')
      expect(label).to be_an_instance_of(Label)
    end

    it 'adds itself to an item\'s label property' do
      label = Label.new('Twitter', 'blue')
      item = Item.new(Time.now.year - 3)
      label.add_item(item)
      expect(item.label).to eql(label)
    end

end