# Appfigures

[![Build Status](https://travis-ci.org/styleseek/appfigures.svg?branch=gem-setup)](https://travis-ci.org/styleseek/appfigures)

## Installation

Add this line to your application's Gemfile:

    gem 'appfigures'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install appfigures

## Usage

proposed syntax
```ruby
appfigures = Appfigures.configure do |config| #Alias for Appfigures::Client.new
  config.client_key = 'your client key'
  config.credentials = 'base 64 encoded username:password'
end

appfigures.sales(start_date: '2014-01-01', end_date: '2015-01-01')
```

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/[my-github-username]/appfigures/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
