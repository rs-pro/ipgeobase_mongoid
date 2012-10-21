# coding: utf-8

class IpgeobaseIp
  include Mongoid::Document

  field :start_ip, type: Integer
  index :start_ip, unique: true
  field :end_ip, type: Integer

  belongs_to :city, class_name: 'IpgeobaseCity'
  validates_presence_of :start_ip, :end_ip, :city_id
end
