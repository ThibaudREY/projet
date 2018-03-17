class Town < ActiveRecord::Base
  before_validation :geocode
  validates :city, :latitude, :longitude, :presence => true
  private
  def geocode
    places = Nominatim.search.city(self.city).limit(1).address_details(true)
    if places && places.first
      self.latitude = places.first.latitude
      self.longitude = places.first.longitude
      self.postcode = places.first.address.postcode
    end
  end

end
