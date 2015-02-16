require 'bundler/setup'
require 'faraday'

def test_redirect(url, expected_location)
  response = Faraday.get(url)

  expected_status = 301

  actual_status = response.status
  actual_location = response.headers[:location]

  puts "#{url} redirects to #{expected_location}"

  if actual_status != expected_status
    throw "Expected #{expected_status}, got #{actual_status}"
  end

  if actual_location != expected_location
    throw "Expected #{expected_location}, got #{actual_location}"
  end
end

test_redirect 'http://pensionwise.gov.uk/', 'https://pensionwise.gov.uk/'
test_redirect 'http://www.pensionwise.gov.uk/', 'https://www.pensionwise.gov.uk/'
test_redirect 'https://pensionwise.gov.uk/', 'https://www.pensionwise.gov.uk/'

test_redirect 'https://www.pensionwise.gov.uk/pension-options',
              'https://www.pensionwise.gov.uk/?utm_source=royal_london&utm_medium=letter&utm_content=1&utm_campaign=signpost'

test_redirect 'https://www.pensionwise.gov.uk/pension-service',
              'https://www.pensionwise.gov.uk/?utm_source=royal_london&utm_medium=letter&utm_content=2&utm_campaign=signpost'

test_redirect 'https://www.pensionwise.gov.uk/pension-guidance',
              'https://www.pensionwise.gov.uk/?utm_source=royal_london&utm_medium=letter&utm_content=3&utm_campaign=signpost'

test_redirect 'https://www.pensionwise.gov.uk/pension-help',
              'https://www.pensionwise.gov.uk/?utm_source=royal_london&utm_medium=letter&utm_content=4&utm_campaign=signpost'

test_redirect 'https://www.pensionwise.gov.uk/pension-planning',
              'https://www.pensionwise.gov.uk/?utm_source=royal_london&utm_medium=letter&utm_content=5&utm_campaign=signpost'

test_redirect 'https://www.pensionwise.gov.uk/pension-support',
              'https://www.pensionwise.gov.uk/?utm_source=royal_london&utm_medium=letter&utm_content=6&utm_campaign=signpost'

test_redirect 'https://www.pensionwise.gov.uk/pension-assistance',
              'https://www.pensionwise.gov.uk/?utm_source=royal_london&utm_medium=letter&utm_content=7&utm_campaign=signpost'

test_redirect 'https://www.pensionwise.gov.uk/pension-direction',
              'https://www.pensionwise.gov.uk/?utm_source=royal_london&utm_medium=letter&utm_content=8&utm_campaign=signpost'

test_redirect 'https://www.pensionwise.gov.uk/guidance-pension',
              'https://www.pensionwise.gov.uk/?utm_source=standard_life&utm_medium=letter&utm_content=1&utm_campaign=signpost'

test_redirect 'https://www.pensionwise.gov.uk/guidance-help',
              'https://www.pensionwise.gov.uk/?utm_source=standard_life&utm_medium=letter&utm_content=2&utm_campaign=signpost'

test_redirect 'https://www.pensionwise.gov.uk/guidance-planning',
              'https://www.pensionwise.gov.uk/?utm_source=standard_life&utm_medium=letter&utm_content=3&utm_campaign=signpost'

test_redirect 'https://www.pensionwise.gov.uk/guidance-scheme',
              'https://www.pensionwise.gov.uk/?utm_source=standard_life&utm_medium=letter&utm_content=4&utm_campaign=signpost'

test_redirect 'https://www.pensionwise.gov.uk/guidance-support',
              'https://www.pensionwise.gov.uk/?utm_source=standard_life&utm_medium=letter&utm_content=5&utm_campaign=signpost'

test_redirect 'https://www.pensionwise.gov.uk/guidance-retirement',
              'https://www.pensionwise.gov.uk/?utm_source=standard_life&utm_medium=letter&utm_content=6&utm_campaign=signpost'

test_redirect 'https://www.pensionwise.gov.uk/guidance-service',
              'https://www.pensionwise.gov.uk/?utm_source=extra&utm_medium=letter&utm_content=1&utm_campaign=signpost'

test_redirect 'https://www.pensionwise.gov.uk/guidance-options',
              'https://www.pensionwise.gov.uk/?utm_source=extra&utm_medium=letter&utm_content=2&utm_campaign=signpost'
