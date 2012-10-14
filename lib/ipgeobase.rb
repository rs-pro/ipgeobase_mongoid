# coding: utf-8

require "ipgeobase/version"

module Ipgeobase
  if defined?(Rails) && defined?(Rails::Engine)
    class Engine < ::Rails::Engine
    end

    module Rails
      class Railtie < ::Rails::Railtie
      end
    end
  end

  def self.find_region_by_ip(user_ip)
    raise ArgumentError, "Must have a ip addres by template 0.0.0.0" unless user_ip =~ /^[\d\.]+$/
    long = ip2long(user_ip)
    ip = IpgeobaseIp.where(start_ip: { '$lte' => long }).order_by({ start_ip: -1 }).limit(1).first
    p ip
    if ip.nil?
      nil
    else
      if ip.end_ip < long
        nil
      else
        ip.city
      end
    end
  end

  def self.ip2long(ip)
    long = 0
    ip.split(/\./).reverse.each_with_index do |b, i|
      long += b.to_i << (8*i)
    end
    long
  end
end
