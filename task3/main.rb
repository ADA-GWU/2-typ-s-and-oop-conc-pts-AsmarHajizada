# Library Catalog System

# TODO: make initialization better

class LibraryItem
  attr_accessor :title, :creator, :pub_year

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

end

class Book < LibraryItem
  attr_accessor :num_pages

  def initialize(title, creator, pub_year, num_pages, genre=nil, rating=nil)  
    super(title, creator, pub_year, genre, rating)
    @num_pages = num_pages
  end

  def long_book?
    @num_pages > 500
  end

  def high_rating?
    @rating > 4.4  # out of 5.0 Goodreads rating
  end

  def display_info
    puts "Title: #{@title}"
    puts "Author: #{creator}"
    puts "Publication Year: #{@pub_year}"
    puts "Number of Pages: #{@num_pages}"
    if @genre
      puts "Genre: #{@genre}"
    end
    if @rating
      puts "Rating: #{@rating}"
    end 
  end

end

class DVD < LibraryItem
  attr_accessor :duration, :director, :rating

  def initialize(title, creator, pub_year, genre=nil, duration=nil, rating=nil)
    super(title, creator, pub_year, genre, rating)
    @duration = duration
  end

  def high_rating?
    @rating > 7.5  # out of 9.0 IMDb rating
  end

  def long_movie?
    @duration > 120
  end

  def display_info
    puts "Title: #{@title}"
    puts "Director: #{@creator}"
    puts "Publication Year: #{@pub_year}"
    if @genre
      puts "Genre: #{@genre}"
    end
    if @duration
      puts "Duration: #{@duration} minutes"
    end
    if @rating
      puts "Rating: #{@rating}"
    end
  end

end

class CD < LibraryItem
  attr_accessor :duration, :artist, :num_tracks, :genre

  def initialize(title, creator, pub_year, duration=nil, num_tracks=nil, genre=nil, rating=nil)
    super(title, creator, pub_year, genre, rating)
    @duration = duration
    @num_tracks = num_tracks
  end

  def long_album?
    @duration > 60
  end

  def display_info
    puts "Title: #{@title}"
    puts "Artist: #{@creator}"
    puts "Publication Year: #{@pub_year}"
    if @duration
      puts "Duration: #{@duration} minutes"
    end
    if @num_tracks
      puts "Number of Tracks: #{@num_tracks}"
    end
    if @genre
      puts "Genre: #{@genre}"
    end
    if @rating
      puts "Rating: #{@rating}"
    end
  end

end


item1 = DVD.new("Incеption", "Christophеr Nolan", 2010, "Sciеncе Fiction", 110)
puts item1.display_info
item2 = Book.new("The Lightning Thief", "Rick Riordan", 2005, 377)
item3 = Book.new("The Song of Ice and Fire", "George R. R. Martin", 1996, 694)
puts item3.long_book?, item3.old?

item4 = CD.new("idk", "Arctic Monkeys", 2018, duration=41, genre="Indie Rock", rating=4.5)
puts item4.display_info
