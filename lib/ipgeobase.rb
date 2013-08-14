# coding: utf-8

require "ipgeobase/version"
require 'ipaddr'

if defined? Rails::Engine
  require 'ipgeobase/engine'
end

if defined? Rails::Railtie
  require 'ipgeobase/railtie'
end

module Ipgeobase
  class << self
    def find_region_by_ip(user_ip)
      long = ip2long(user_ip)
      ip = Ipgeobase::Ip.where(start_ip: { '$lte' => long }).order_by({ start_ip: -1 }).limit(1).first
      if ip.nil? or ip.end_ip < long
        nil
      else
        ip.city
      end
    end

    def ip2long(ip)
      IPAddr.new(ip, Socket::AF_INET).to_i
    end
  end
end
