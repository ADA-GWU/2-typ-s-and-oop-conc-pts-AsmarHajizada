# Library Catalog System

class LibraryItem
  attr_accessor :title, :author, :pub_year

  def initialize(title, author, pub_year)
    @title = title
    @author = author
    @pub_year = pub_year
  end

  def old?
    @pub_year < 2000
  end

end

class Book < LibraryItem
  attr_accessor :num_pages

  def initialize(title, author, pub_year, num_pages)
    super(title, author, pub_year)
    @num_pages = num_pages
  end

  def long_book?
    @num_pages > 500
  end

end


item1 = Book.new("The Great Gatsby", "F. Scott Fitzgerald", 1925, 218)
puts item1.title, item1.author, item1.pub_year, item1.num_pages, item1.old?, item1.long_book?
