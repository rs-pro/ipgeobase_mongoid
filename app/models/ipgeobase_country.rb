# coding: utf-8

class IpgeobaseCountry
  include Mongoid::Document

  field :name, type: String
  field :code, type: String

  has_many :cities, class_name: 'IpgeobaseCity'

  validates_presence_of :name
end
