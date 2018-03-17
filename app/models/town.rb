class Town < ActiveRecord::Base

  after_validation :geocode

  private
  def geocode
    places = Nominatim.search.city(self.city).limit(1).address_details(true)
    for place in places
      self.latitude = place.latitude
      self.longitude = place.longitude
      self.postcode = place.address.postcode
    end
  end

end
