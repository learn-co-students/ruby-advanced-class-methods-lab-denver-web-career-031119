require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    # binding.pry
    self.class.all << self
  end

  # new code

  def self.create
    song = Song.new
    # self
    song.save
    # binding.pry
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find{ |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    Song.create_by_name(name) unless Song.find_by_name(name)
    Song.find_by_name(name)
  end

  def self.alphabetical
    @@all.map{ |song| song.name}.sort.map{|name| find_by_name(name)}
    # binding.pry
  end

  def self.new_from_filename(file_name)
    # binding.pry
    split_name = file_name.split(' - ')
    split_name2 = [split_name, split_name[1].split('.')].flatten
    # Song.create_by_name(file_name.split(' - ')[1].split('.')[0])
    # binding.pry
    new_song = Song.create_by_name(split_name2[2])
    new_song.artist_name = split_name2[0]
    new_song
  end

  def self.create_from_filename(file_name)
    # binding.pry


    new_from_filename(file_name)
  end

  def self.destroy_all
    @@all = []
  end







end
