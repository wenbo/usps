require "rubygems"
require 'active_support/all'
require 'ruby-debug'

require "./init.rb"
include FotoVerite

#usps = USPS.new('176KEMBO1735')
usps = USPS.new('966KEMBO4843')
packages = [
  Package.new(100,                        # 100 grams
              [93,10],                    # 93 cm long, 10 cm diameter
              :cylinder => true),         # cylinders have different volume calculations

              Package.new((7.5 * 16),                 # 7.5 lbs, times 16 oz/lb.
                          [15, 10, 4.5],              # 15x10x4.5 inches
                          :units => :imperial)        # not grams, not centimetres
]
#Create a location to use with the Api
sender =Location.new(
  :name => "Matthew Bergman ",
  :first_name => "Matthew",
  :last_name => "Bergman",
  :address1 => "Apt 4m",
  :address2 => "1001 Pine Street", 
  :city => "New York",
  :state => "NY",
  :zip5 => "100010",
  :phone => "5555555555"
)

# #International Item Class
# #Only should be used in conjunction with the Internal Label Api 
Items = [
  InternationalItem.new(
    :description => "Pens", 
    :quantity => "50",
    :value => 200.40, #Will be converted back to a float if entered as a string. 
    :ounces => "50",                            
    :tariff_number => "Only use if known",   #Optional input for the api. 
    :country => "United States"
  ),

  InternationalItem.new( 
    :description => "Against The Day, Pynchon",
    :quantity => "10",
    :value => 100.25,
    :ounces => "250",
    :country => "United States"
  )
]
puts usps.domestic_rates("20770", "10010", packages, options={})
