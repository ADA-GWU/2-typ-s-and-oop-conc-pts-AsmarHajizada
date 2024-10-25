# Library Catalog System

# TODO: make initialization better

class LibraryItem

  # getter and setter methods needed to access (extend)
  # attr_reader
  # attr_writer

  # don't forget public and private
  # accessing protected methods from subclass is allowed
  # accessing private methods from subclass is not allowed (but works somehow???)


  attr_reader :title, :creator, :pub_year

  def initialize(title, creator, pub_year, genre=nil, rating=nil)  # creator is used instead of author to represent all subclasses
    @title = title
    @creator = creator
    @pub_year = pub_year
    @genre = genre
    @rating = rating
  end

  def old?
    @pub_year < 2000
  end

  def display_info
    puts "Item Type: #{self.class}"
    puts "Title: #{@title}"
  end

end

class Book < LibraryItem
  attr_reader :num_pages

  def initialize(title, author, pub_year, num_pages, genre=nil, rating=nil)  
    super(title, author, pub_year, genre, rating)
    @num_pages = num_pages
  end

  def long_book?
    @num_pages > 500
  end

  def high_rating?
    @rating > 4.4  # out of 5.0 Goodreads rating
  end

  def display_info
    super
    puts "Author: #{@creator}"
    puts "Publication Year: #{@pub_year}"
    puts "Number of Pages: #{@num_pages}"
    puts "Genre: #{@genre}" if @genre
    puts "Rating: #{@rating}" if @rating
    
  end

end

class DVD < LibraryItem
  attr_reader :duration

  def initialize(title, director, pub_year, duration, genre=nil, rating=nil)
    super(title, director, pub_year, genre, rating)
    @duration = duration
  end

  def high_rating?
    @rating > 7.5  # out of 9.0 IMDb rating
  end

  def long_movie?
    @duration > 120
  end

  def display_info
    super
    puts "Director: #{@creator}"
    puts "Publication Year: #{@pub_year}"
    puts "Duration: #{@duration} minutes"
    puts "Genre: #{@genre}" if @genre
    puts "Rating: #{@rating}" if @rating
  end

end

class CD < LibraryItem
  attr_reader :duration, :num_tracks

  def initialize(title, artist, pub_year, duration, num_tracks, genre=nil, rating=nil)
    super(title, artist, pub_year, genre, rating)
    @duration = duration
    @num_tracks = num_tracks
  end

  def long_album?
    @duration > 60
  end

  def display_info
    super
    puts "Artist: #{@creator}"
    puts "Publication Year: #{@pub_year}"
    puts "Duration: #{@duration} minutes"
    puts "Number of Tracks: #{@num_tracks}"
    puts "Genre: #{@genre}" if @genre
    puts "Rating: #{@rating}" if @rating
  end

end

class Library
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def remove_item(title)
    @items.reject! { |item| item.title == title }
  end

  def display_all_items
    @items.each(&:display_info)
  end
end


# Testing
book = Book.new("Concеpts of Programming Languagеs", "Robеrt Sеbеsta", 440, 2015, "Programming")
dvd = DVD.new("Incеption", "Christophеr Nolan", 2010, 120, "Sciеncе Fiction")
cd = CD.new("A Day at thе Racеs", "Quееn", 1976, 144, "Rock")

library = Library.new
library.add_item(book)
library.add_item(dvd)
library.add_item(cd)

library.display_all_items