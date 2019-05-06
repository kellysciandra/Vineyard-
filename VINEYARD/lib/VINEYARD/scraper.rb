class VINEYARD::Scraper

  # uses Nokogiri and open-uri to grab info from site
  # Instantiate's hotel object and saves object's properties

  def scrape_events
    @doc = Nokogiri::HTML(open('http://web.mvy.com/Hotels'))
    @doc.search('div.ListingResults_All_CONTAINER').collect do |name|
      hotel = VINEYARD::Hotels.new
      hotel.name = name.css('div.ListingResults_All_ENTRYTITLELEFTBOX').text.strip
      hotel.address = name.css('div.ListingResults_Level5_MAINLEFTBOX span')[0..0].text.strip
      hotel.phone = name.css('div.ListingResults_Level5_PHONE1').text.strip
      hotel.description = name.css('div.ListingResults_Level5_DESCRIPTIONBOX').text.strip
      hotel.save
    end
  end
end
