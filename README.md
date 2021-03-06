# Fund

[![Gem Version](https://badge.fury.io/rb/fund.svg)](https://badge.fury.io/rb/fund) 
[![Build Status](https://travis-ci.org/nazarhussain/fund.svg?branch=master)](https://travis-ci.org/nazarhussain/fund)
[![Code Climate](https://codeclimate.com/github/nazarhussain/fund.svg)](https://codeclimate.com/github/nazarhussain/fund)


If you ever need to build a ruby based app where you need currency conversion. This gem will help you in every aspect.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fund'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fund

## Usage

Create the objects like 
```ruby
 Fund.new(100)
 Fund.new(100, :usd)
 Fund.new(25.45, :eur)
```
For more details see the test [specs](/spec)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nazarhussain/fund. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

