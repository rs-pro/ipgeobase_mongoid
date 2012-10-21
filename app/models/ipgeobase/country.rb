# coding: utf-8

module Ipgeobase
  class Country
    include Mongoid::Document

    field :name, type: String
    field :code, type: String

    has_many :cities, class_name: 'Ipgeobase::City'

    validates_presence_of :name
  end
end
