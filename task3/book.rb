require_relative 'library_item'

class Book < LibraryItem
  attr_reader :num_pages

  BOOK_LENGTH_THRESHOLD = 500
  BOOK_RATING_THRESHOLD = 4.4 # out of 5.0 Goodreads rating

  def initialize(title, author, pub_year, num_pages, genre=nil, rating=nil)  
    super(title, author, pub_year, genre, rating)
    @num_pages = num_pages
  end

  def long_book?
    @num_pages > BOOK_LENGTH_THRESHOLD
  end

  def high_rating?
    @rating > BOOK_RATING_THRESHOLD
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