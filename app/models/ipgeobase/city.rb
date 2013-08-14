# coding: utf-8
module Ipgeobase
  class City
    include Mongoid::Document

    field :geo_id, type: Integer
    index({geo_id: 1}, {unique: true})

    field :city, type: String
    field :region, type: String
    field :district, type: String

    field :lat, type: Float
    field :lon, type: Float

    belongs_to :country, class_name: 'Ipgeobase::Country'
    has_many :ips, class_name: 'Ipgeobase::Ip'

    validates_presence_of :city, :country, :geo_id
  end
end
