# coding: utf-8

require 'spec_helper'

describe Ipgeobase do
  it 'finds city by ip' do
    geo = Ipgeobase::find_region_by_ip('95.170.177.170')
    geo.region.should eq 'Красноярский край'
    geo.country.code.should eq 'RU'
  end
  it "doesn't return first or last city on fail" do
    geo = Ipgeobase::find_region_by_ip('0.0.0.0')
    geo.should be_nil
    geo = Ipgeobase::find_region_by_ip('10.0.0.0')
    geo.should be_nil
    geo = Ipgeobase::find_region_by_ip('255.255.255.255')
    geo.should be_nil
  end
end