require_relative 'library_item'

class DVD < LibraryItem
  attr_reader :duration

  HIGH_RATING_THRESHOLD = 7.5 # out of 9.0 IMDb rating
  DURATION_THRESHOLD = 120

  def initialize(title, director, pub_year, duration, genre=nil, rating=nil, age_restriction=nil)
    super(title, director, pub_year, genre, rating)
    @duration = duration
    @age_restriction = age_restriction
  end

  def high_rating?
    @rating > HIGH_RATING_THRESHOLD
  end

  def long_movie?
    @duration > DURATION_THRESHOLD
  end

  def display_info
    super
    puts "Director: #{@creator}"
    puts "Publication Year: #{@pub_year}"
    puts "Duration: #{@duration} minutes"
    puts "Genre: #{@genre}" if @genre
    puts "Rating: #{@rating}" if @rating
    puts "Recommended viewing age: #{@age_restriction}+" if @age_restriction
  end

end