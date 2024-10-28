require_relative 'library_item'

class CD < LibraryItem
  attr_reader :duration, :num_tracks

  DURATION_THRESHOLD = 60

  def initialize(title, artist, pub_year, duration, num_tracks, genre=nil) # didn't add rating for CD
    super(title, artist, pub_year, genre)
    @duration = duration
    @num_tracks = num_tracks
  end

  def long_album?
    @duration > DURATION_THRESHOLD
  end

  def display_info
    super
    puts "Artist: #{@creator}"
    puts "Publication Year: #{@pub_year}"
    puts "Duration: #{@duration} minutes"
    puts "Number of Tracks: #{@num_tracks}"
    puts "Genre: #{@genre}" if @genre
  end

end