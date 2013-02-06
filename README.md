# Popolo

[![Build Status](https://secure.travis-ci.org/opennorth/popolo.png)](http://travis-ci.org/opennorth/popolo)
[![Dependency Status](https://gemnasium.com/opennorth/popolo.png)](https://gemnasium.com/opennorth/popolo)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/opennorth/popolo)

Popolo's goal is to make it easier for civic developers to create government transparency, monitoring and engagement websites.

Popolo is a [Ruby on Rails engine](http://guides.rubyonrails.org/engines.html) that provides additional functionality to a [Ruby on Rails](http://rubyonrails.org/) application, so that developers can focus on what's special about the governments they want to monitor, instead of re-implementing features commonly found in open government websites. The core Popolo engine provides basic models, controllers and views for the objects found in all open government websites – people, organizations and the relationships between the two. Other engines provide additional functionality.

In addition to being a Rails engine, Popolo is also a [data standard](http://popoloproject.com/data.html) and an [API specification](http://popoloproject.com/api.html).

## Dependencies

Popolo uses Mongoid, which supports only MRI 1.9.3 and HEAD, and JRuby 1.6.0+ in 1.9 mode.

Until [carrierwave-mongoid](https://github.com/jnicklas/carrierwave-mongoid) releases its [Mongoid 3 branch](https://github.com/jnicklas/carrierwave-mongoid/tree/mongoid-3.0) ([jnicklas/carrierwave-mongoid#29](https://github.com/jnicklas/carrierwave-mongoid/pull/29#issuecomment-7249357)), add the following to your Gemfile:

```ruby
gem 'carrierwave-mongoid', git: 'git://github.com/jnicklas/carrierwave-mongoid.git', branch: 'mongoid-3.0'
```

## Bugs? Questions?

This engine's main repository is on GitHub: [http://github.com/opennorth/popolo](http://github.com/opennorth/popolo), where your contributions, forks, bug reports, feature requests, and feedback are greatly welcomed.

## Acknowledgements

This gem is developed by [Open North](http://www.opennorth.ca/) through a partnership with the [Participatory Politics Foundation](http://www.participatorypolitics.org/).

Copyright (c) 2012 Open North Inc., released under the MIT license
