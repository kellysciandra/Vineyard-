class VINEYARD::Hotels
  attr_accessor :name, :phone, :address, :description
  # Class variable stores all topics objects.
  @@all = []

  def initialize
    @name = name
    @phone = phone
    @address = address
    @desctiption = description
  end
  # Class method to get all topics.
  def self.all
    @@all
  end
  # Saves hotel object into @@all.
  def save
    @@all << self
  end
  # class method open's webpage in browser
  def self.open_in_browser
   system("open 'http://web.mvy.com/Hotels' ")
 end
end
