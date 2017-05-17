#!/usr/bin/env ruby

require 'bundler/setup'
require 'date'
require 'mechanize'

domain = ARGV[0]

puts ">> Checking #{domain} at #{Time.now}"

mech = Mechanize.new

if ENV['AUTH_USERNAME'] && ENV['AUTH_PASSWORD']
  mech.add_auth(domain, ENV['AUTH_USERNAME'], ENV['AUTH_PASSWORD'])
end

page = mech.get("#{domain}/en/locations")

if page.body =~ /Find an appointment location near you/
  puts '> Renders location finder'
else
  raise 'Should render location finder'
end

page = mech.get("#{domain}/en/locations?postcode=LONDON")
if page.body =~ /is not a valid postcode/
  puts '> Renders invalid postcode message'
else
  raise 'Should render invalid postcode message'
end

page = mech.get("#{domain}/en/locations?postcode=rg29af")
if page.body =~ /Appointment locations near/
  puts '> Renders locations'
else
  raise 'Should render locations'
end

page = page.link_with(dom_class: 't-location-link').click

if page.body =~ /Reading/
  puts '> Renders location'
else
  raise 'Should render location'
end

puts '>> OK'
