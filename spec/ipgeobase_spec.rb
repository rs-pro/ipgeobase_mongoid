# coding: utf-8

require 'spec_helper'

describe Ipgeobase do
  it 'finds city by ip' do
    geo = Ipgeobase::find_region_by_ip('95.170.177.170')
    geo.region.should eq 'Красноярский край'
    geo.country.code.should eq 'RU'
  end
end