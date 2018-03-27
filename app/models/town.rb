class Town < ActiveRecord::Base
  before_validation :geocode
  validates :city, :latitude, :longitude, :presence => true
  validates_uniqueness_of :city

  def weather
    ForecastIO.forecast(self.latitude, self.longitude, params: { units: 'si' }).currently
  rescue StandardError
    nil
  end

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
