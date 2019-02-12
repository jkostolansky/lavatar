# Lavatar

Create letter avatars from user initials.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lavatar'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install lavatar
```

## Configuration

You can override default configuration, for example in `config/initializers/lavatar.rb`:

```ruby
Lavatar.configure do |config|
  config.saturation  = 0.4 # from 0 to 1
  config.lightness   = 0.5 # from 0 to 1
  config.font_size   = 48  
  config.font_weight = 700
  config.font_color  = "#ffffff"  
end
```

## Usage

```ruby
lavatar_tag("JK", 24, {  # (required) letters and size (width and height)
  key:        123,       # user identifier to pick a color (ID, email, ...)  
  color:      "#9e5555", # forced background color  
  font_color: "#ffffff", # font color  
  class:      "my-class" # SVG element classes
)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jkostolansky/lavatar. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Lavatar project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jkostolansky/lavatar/blob/master/CODE_OF_CONDUCT.md).
