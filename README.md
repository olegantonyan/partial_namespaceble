# ToPartialPathFix

Monkey-patch for this issue [rails/rails/issues/21004](https://github.com/rails/rails/issues/21004)

Let's say you have namespaced models, like these:
```ruby
# app/models/user.rb
class User < ActiveRecord::Base
  has_one :profile
end

# app/models/user/profile.rb
class User::Profile < ActiveRecord::Base
  belongs_to :user
end
```
And you want to render model's partial in a template, like this:

```ruby
render @user.profile
```
Where should you put your `profile` partial? My answer is `app/views/users/profiles/`, but rails disagree and raises missing partial because it tries to find this partial in `app/views/user/profiles`.
There is a special method `to_partial_path` in `ActiveModel` which is responsible for partial path, but you don't want to override it on each of your models. That's why this gem exists.

I hope this behavior will be fixed in rails soon.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'to_partial_path_fix', github: 'olegantonyan/to_partial_path_fix'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install to_partial_path_fix

## Usage

Just install it and that's it!

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/olegantonyan/to_partial_path_fix. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
