Installs imagemagick (7.0.4) from source.

# Supported Platforms

Tested on Ubuntu 14.04. 

# Usage

## Chef

Include `imagemagick` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[imagemagick::source]"
  ]
}
```

## Vagrant chef-librarian

Include this cookbook in your `Cheffile`:

```ruby
cookbook "imagemagick", :git => "https://github.com/teamsquare/chef-imagemagick"
```

Then include this in your `Vagrant` file

```ruby
config.vm.provision :chef_solo do |chef|
  ...
  chef.add_recipe 'imagemagick::source'
  ...
end
```

# Contributing

1. Fork it
1. Create your feature branch (`git checkout -b my-new-feature`)
1. Commit your changes (`git add -p ./path/to/files; git commit -m 'Add some feature'`)
1. Push to the branch (`git push origin my-new-feature`)
1. Create new Pull Request

# License

The recipe is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).