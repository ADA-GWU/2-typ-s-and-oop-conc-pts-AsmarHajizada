class LibraryItem

  attr_reader :title, :creator, :pub_year
  attr_accessor :genre, :rating

  def initialize(title, creator, pub_year, genre=nil, rating=nil)  # creator is used instead of author to represent all subclasses
    # validate year
    
    @title = title
    @creator = creator
    @pub_year = validate_year(pub_year) 
    @genre = genre
    @rating = rating
  end

  def to_s # this will be called when we refer to object itself (in library class)
    "#{title} by #{creator} (#{pub_year})"
  end

  def old?
    @pub_year < 2000
  end

  def display_info
    puts "Item Type: #{self.class}"
    puts "Title: #{@title}"
  end

  # helper function to avoid incorrect year format
  private
  def validate_year(pub_year)
    begin
      pub_year = Integer(pub_year) if pub_year.is_a?(String) # try to convert if it is a string
    rescue ArgumentError
      raise ArgumentError, "Publication year must be a numeric value."
    end

    if pub_year.is_a?(Integer) && pub_year < 0
      raise ArgumentError, "Publication year must be a positive value."
    end

    pub_year
  end

end