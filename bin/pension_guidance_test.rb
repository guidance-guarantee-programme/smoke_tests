#!/usr/bin/env ruby

require 'bundler/setup'
require 'date'
require 'faraday'

domain = ARGV[0]
staging = domain =~ /staging/
production = !staging
pages = %w(
  /en
  /en/telephone-appointments/new
  /en/locations/a801a72d-91be-4a33-86a6-3d652cfc00d0/booking-request/step-one
  /en/adjustable-income
  /en/appointments
  /en/benefits
  /en/browse/illness-and-death
  /en/browse/more
  /en/browse/taking-your-pension-money
  /en/browse/tax-and-getting-advice
  /en/browse/your-pension-details
  /en/care-costs
  /en/transfer-pension
  /en/contact
  /en/cookies
  /en/debt
  /en/divorce
  /en/financial-advice
  /en/guaranteed-income
  /en/leave-pot-untouched
  /en/living-abroad
  /en/locations
  /en/locations/15fd41b2-439a-448a-b775-b2b61e16d4bb
  /en/making-money-last
  /en/mix-options
  /en/pension-complaints
  /en/pension-pot-options
  /en/pension-pot-value
  /en/pension-types
  /en/privacy
  /en/protection
  /en/scams
  /en/selling-your-annuity
  /en/shop-around
  /en/take-cash-in-chunks
  /en/take-whole-pot
  /en/tax
  /en/when-you-die
  /en/work-out-income
  /cy/selling-your-annuity
  /cy/shop-around
  /cy/take-cash-in-chunks
  /cy/take-whole-pot
  /cy/tax
  /cy/when-you-die
  /cy/work-out-income
)

puts ">> Checking #{domain} at #{Time.now}"

conn = Faraday.new(domain)

for page in pages do
  puts page
  response = conn.get(page)

  unless response.status == 200
    raise "Status code was #{response.status}"
  end

  if production
    unless DateTime.parse(response.headers['expires']).to_time > Time.now
      raise "Expires at #{response.headers['expires']}"
    end
  end
end

puts '>> OK'
