# coding: utf-8

module Ipgeobase
  class Ip
    include Mongoid::Document

    field :start_ip, type: Integer
    index({start_ip: 1}, {unique: true})
    field :end_ip, type: Integer

    belongs_to :city, class_name: 'Ipgeobase::City'
    validates_presence_of :start_ip, :end_ip, :city_id
  end
end
