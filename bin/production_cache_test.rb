#!/usr/bin/env ruby

require 'bundler/setup'
require 'date'
require 'faraday'

domain = 'https://www.pensionwise.gov.uk'
pages = %w(
  /
  /6-steps-you-need-to-take
  /adjustable-income
  /already-bought-annuity
  /appointments
  /benefits
  /contact
  /cookies
  /cymraeg
  /divorce
  /guaranteed-income
  /leave-pot-untouched
  /living-abroad
  /making-money-last
  /mix-options
  /pension-complaints
  /pension-pot-options
  /pension-pot-value
  /pension-types
  /protection
  /scams
  /shop-around
  /take-cash
  /tax
  /when-you-die
  /work-out-income
)

puts ">> Checking #{domain} at #{Time.now}"

conn = Faraday.new(domain)

for page in pages do
  puts page
  response = conn.get(page)

  unless response.status == 200
    raise "Status code was #{response.status}"
  end

  unless DateTime.parse(response.headers['expires']).to_time > Time.now
    raise "Expires at #{response.headers['expires']}"
  end
end

puts '>> OK'
