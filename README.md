# YanyingRubyextension

Just extend Ruby standard libs and Rails gems



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yanying_rubyextension'
```

add this line to your project:
~~~ruby
extend yanying_rubyextension
~~~



## Usage

~~~ruby
active_admin#model:
ActiveAdmin.register City do
  permit_params model.column_names  # instead of listing all the column names with hand
  actions :all, except: [ :destroy ]
end
~~~


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/yanying_rubyextension. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

