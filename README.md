app_figures
===========

[![Build Status](https://travis-ci.org/styleseek/app_figures.svg?branch=master)](https://travis-ci.org/styleseek/app_figures)[![Code Climate](https://codeclimate.com/github/styleseek/app_figures.png)](https://codeclimate.com/github/styleseek/app_figures)

Simple API Client for [AppFigures.com](http://appfigures.com/), supports pulling in products and sales from AppFigures with Basic Auth. Send us a pull request and help us expand the support of API this gem covers

If this gem doesn't meet your needs, there is an older [appfigures api client](http://rubygems.org/gems/appfigures) that may be better suited, but only supports the AppFigures API `v1`.

## Installation

Add this line to your application's Gemfile:

    gem 'app_figures'

And then execute:

    $ bundle

Or install it globally:

    $ gem install app_figures

## Usage

### Register your app with AppFigures.com

This gem currently only supports Basic Auth, but still requires you to register your app to get a client key.

1. While logged into AppFigures, visit: https://appfigures.com/developers/keys
2. Click 'Create a New Client', give it a name, and set your permissions. This gem needs at least `READ` access to "Product Meta Data" and "Private Data".
3. Click 'Make me an app' to complete the registration and get yoru client key.

### Configuration

To configure the gem to access the API, you will need the client key you created above, and the username and password of a user on your AppFigures account.

The username and password needs to be combined and base64 encoded before being passed to the gem. You can do that easily in the terminal:

    $ echo -n "username:password" | base64

This is covered in more detail in the [AppFigures API documentation](http://docs.appfigures.com/api/reference/v2/authentication).

#### ENV variables

The preferred method of configuring authentication for the gem is through environment variables:

Two `ENV` vars are needed:

  - `APPFIGURES_CLIENT_KEY` (your client key)
  - `APPFIGURES_CREDENTIALS` (base 64 encoded username:password)

Once those are set, you can instantiate a new client:

```ruby
AppFigures.client
# => #<AppFigures::Client:0x007fc5c304e8f0 @client_key="...", @credentials="...">
```
#### Options Hash

You can also pass `AppFigures.client` your authentication values in the options hash:

```ruby
AppFigures.client(client_key: 'abc', credentials: 'xyz')
# => #<AppFigures::Client:0x007fc5c304e8f0 @client_key="abc", @credentials="xyz">
```

Passed in options will take precedence over the ENV vars.


### Making Requests

#### Products

Example:

```ruby
client = AppFigures.client
products = client.products
# => ...
```

#### Sales

Example:

```ruby
client = AppFigures.client
sales = client.sales
# => ...
```

## Contributing

1. Fork it ( https://github.com/styleseek/app_figures/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
