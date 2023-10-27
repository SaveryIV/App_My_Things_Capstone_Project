require_relative '../classes/music_album'
require_relative '../classes/item'
require 'rspec'

describe MusicAlbum do
  let(:published_date) { '2002-1-1' }
  let(:on_spotify) { 'y' }

  subject { described_class.new(published_date, on_spotify) }

  it 'should be an instance of MusicAlbum' do
    expect(subject).to be_an_instance_of(MusicAlbum)
  end

  it 'should inherit from Item' do
    expect(subject).to be_a(Item)
  end

  it 'should have a published date' do
    expect(subject.publish_date).to eq(published_date)
  end

  it 'should be on Spotify' do
    expect(subject.on_spotify?).to be(true)
  end

  it 'can be archived if it is on Spotify' do
    result = subject.instance_eval { can_be_archived? }
    expect(result).to be(true)
  end

  it 'can be archived if its published date is in the past' do
    past_date = '2002-1-1'
    subject.publish_date = past_date
    result = subject.instance_eval { can_be_archived? }
    expect(result).to be(true)
  end

  it 'cannot be archived if it is not on Spotify' do
    subject.on_spotify = 'n'
    result = subject.instance_eval { can_be_archived? }
    expect(result).to be(false)
  end
end
