require 'rgeo'
require 'rgeo-activerecord'

RGeo::ActiveRecord::SpatialFactoryStore.instance.tap do |config|
  config.default = RGeo::Geographic.spherical_factory(srid: 4326)
end

module Notifiable
  class DeviceToken < ActiveRecord::Base
    belongs_to :app, :class_name => "Notifiable::App"
    has_many :notification_statuses, :class_name => "Notifiable::NotificationStatus"
    
    validates :token, presence: true, uniqueness: { scope: :app }
    validates :provider, presence: true
    validates :app, presence: true
    
    scope :nearby, -> (lon, lat, radius){ where("ST_DWithin(lonlat, ST_MakePoint(?,?), ?)", lon, lat, radius) }    
  end
end
