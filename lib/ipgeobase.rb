# coding: utf-8

require "ipgeobase/version"

module Ipgeobase
  if defined?(Rails::Engine)
    class Engine < ::Rails::Engine
    end
  end

  def self.find_region_by_ip(user_ip)
    raise ArgumentError, "IP address is expected" unless user_ip =~ /\A\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\Z/
    long = ip2long(user_ip)
    ip = Ipgeobase::Ip.where(start_ip: { '$lte' => long }).order_by({ start_ip: -1 }).limit(1).first
    if ip.nil? or ip.end_ip < long
      nil
    else
      ip.city
    end
  end

  def self.ip2long(ip)
    long = 0
    ip.split('.').reverse.each_with_index do |b, i|
      long += b.to_i << (8*i)
    end
    long
  end
end
