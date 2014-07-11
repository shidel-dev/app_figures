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

```list_products``` will give all registered products (can be filtered by store) see: http://docs.appfigures.com/products#Listing_all_of_your_products

```product_by_id``` will give one registered product by it's appfigures id see: http://docs.appfigures.com/products#Getting_a_product_by_its_id

Examples:

```ruby
client = AppFigures.client
my_products = client.list_products
=> {"397821346"=>
  {"id"=>397821346,
   "name"=>"Example app",
   "developer"=>"Example App maker",
   "icon"=>
    "http:/icon.com/icon.png",
   "vendor_identifier"=>"763309467",
   "ref_no"=>7634478,
   "sku"=>"EXAMPLE",
   "package_name"=>nil,
   "store_id"=>1,
   "store"=>"apple",
   "storefront"=>"apple:ios",
   "release_date"=>"2013-14-02T05:00:00-05:00",
   "added_date"=>"2013-14-03T20:17:23-05:00",
   "updated_date"=>"2014-08-20T02:52:22-04:00",
   "version"=>"3.0.1",
   "source"=>
    {"external_account_id"=>76435,
     "added_timestamp"=>"2014-06-06T00:00:00",
     "active"=>true,
     "hidden"=>false,
     "type"=>"own"},
   "type"=>"app",
   "devices"=>["Handheld", "Tablet"],
   "children"=>[],
   "features"=>[],
   "parent_id"=>nil,
   "price"=>{"currency"=>"USD", "price"=>"0.00"}},
 "400718594467"=>
  {"id"=>40071854567,
   "name"=>"EXAMPLE app 2",
   "developer"=>"Example app maker",...}}
   
   
   
one_product = client.product_by_id("397821346")
=> {"id"=>397821346,
 "name"=>"Example app",
 "developer"=>"Example app maker",
 "icon"=>
  "http:/icon.com/icon.png"
 "vendor_identifier"=>"763309467",
 "ref_no"=>7634478,
 "sku"=>"Example",....}

```

#### Sales

Example:

```ruby
client = AppFigures.client
sales = client.sales
=> {"downloads"=>4589,
 "updates"=>11234,
 "returns"=>0,
 "net_downloads"=>4589,
 "promos"=>0,
 "revenue"=>"0.00",
 "edu_downloads"=>0,
 "gifts"=>0,
 "gift_redemptions"=>0}
```

#### External Accounts
Example:
```ruby
client = AppFigures.client
client.external_accounts
=> {"7648"=>
  {"id"=>76348,
   "account_id"=>89138,
   "nickname"=>"my nickname",
   "username"=>"example@email.com",
   "auto_import"=>true,
   "store_id"=>2,
   "store"=>"google_play",
   "metadata"=>{}},
 "79034"=>
  {"id"=>77392,
   "account_id"=>89138,
   "nickname"=>"my nickname",
   "username"=>"example@email.com",
   "auto_import"=>true,
   "store_id"=>1,
   "store"=>"apple",
   "metadata"=>{"vendor_id"=>78920uy3}}}
```

## Contributing

1. Fork it ( https://github.com/styleseek/app_figures/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
