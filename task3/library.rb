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

  def filter_by_genre(genre)
    @items.select { |item| item.genre == genre }
  end

  def list_old_items
    @items.select(&:old?)
  end

  # full information
  def display_all_items
    @items.each { |item| puts item.display_info; puts }
  end

  # short information
  def display_catalog
    @items.each { |item| puts item }
  end

end