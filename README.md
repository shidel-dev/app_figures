# Appfigures

[![Build Status](https://travis-ci.org/styleseek/appfigures.svg?branch=gem-setup)](https://travis-ci.org/styleseek/appfigures)
[![Code Climate](https://codeclimate.com/github/styleseek/appfigures.png)](https://codeclimate.com/github/styleseek/appfigures)

Simple Ruby client for tracking mobile applications with AppFigures.com's api.

## Installation

Add this line to your application's Gemfile:

    gem 'appfigures'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install appfigures

## Usage
###configuration

Your authentication information can be configured in two different ways.

####ENV variables
This is the preferred method as it keeps your config details in a private file.

Two ENV vars are needed:  
'APPFIGURES_CLIENT_KEY' -- your client key   
'APPFIGURES_CREDENTIALS' -- base 64 encoded username:password prefixed with Basic.   
Example: ENV['APPFIGURES_CREDENTIALS'] = 'Basic j28fhj93nvbd9ab=='    

```ruby
AppFigures.client
```
This method will return a client object.

####Using an option hash

AppFigures.client can also take an options hash with your authentication information.

```ruby
AppFigures.client({credentials: 'base 64 encoded username:password', client_key: 'your client key'})
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/appfigures/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
