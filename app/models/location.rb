class Location < ActiveRecord::Base
  belongs_to :user
  attr_accessible :address

  acts_as_gmappable lat:               'lat',
                    lng:               'lng',
                    process_geocoding: :geocode?,
                    address: 'address',
                    normalized_address: 'address',
                    callback:           :customize_address,
                    msg: 'Sorry, not even Google could figure out where that is'

  protected

  def geocode?
    (!address.blank? && (lat.blank? || lng.blank?)) || address_changed?
  end

  def customize_address(data)
    data['address_components'].each do |c|
      if c['types'].include? 'country'
        self.country = c['long_name']
      elsif c['types'].include? 'locality'
        self.city = c['long_name']
      end
    end
  end
end
