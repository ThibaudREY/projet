class Town < ActiveRecord::Base

  after_validation :geocode

  private
  def geocode
    place = Nominatim.search.city(self.city).limit(1).address_details(true).first

    self.latitude = place.latitude
    self.longitude = place.longitude
    self.postcode = place.address.postcode

  end

end
