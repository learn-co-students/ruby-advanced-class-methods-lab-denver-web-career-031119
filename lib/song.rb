require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.new
    song.name = song_name
    @@all << song
    song
  end

  def self.find_by_name(song_name)
    @@all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    song = Song.find_by_name(song_name)
    song != nil ? song : Song.create_by_name(song_name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    data = filename.split(/[-.]/)
    song = Song.new
    song.name = data[1].strip
    song.artist_name = data[0].strip
    song
  end

  def self.create_from_filename(filename)
    data = filename.split(/[-.]/)
    song = Song.new
    song.name = data[1].strip
    song.artist_name = data[0].strip
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
