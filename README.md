# Popolo

[![Build Status](https://secure.travis-ci.org/opennorth/popolo.png)](http://travis-ci.org/opennorth/popolo)
[![Dependency Status](https://gemnasium.com/opennorth/popolo.png)](https://gemnasium.com/opennorth/popolo)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/opennorth/popolo)

Popolo's goal is to make it easier for civic developers to create government transparency, monitoring and engagement websites.

Popolo is a [Ruby on Rails engine](http://guides.rubyonrails.org/engines.html) that provides additional functionality to a [Ruby on Rails](http://rubyonrails.org/) application, so that developers can focus on what's special about the governments they want to monitor, instead of re-implementing features commonly found in open government websites. The core Popolo engine provides basic models, controllers and views for the objects found in all open government websites – people, organizations and the relationships between the two. Other engines provide additional functionality.

In addition to being a Rails engine, Popolo is also a [data standard](http://popoloproject.com/data.html) and an [API specification](http://popoloproject.com/api.html).

## Getting Started

Popolo uses Mongoid to connect to MongoDB, which requires Rails 3 and supports only MRI 1.9.3 and HEAD, and JRuby 1.6.0+ in 1.9 mode.

First, create your Rails application:

    rails new myapp --skip-active-record

Add the `popolo` gem to your `Gemfile`:

    gem 'popolo'

If you didn't run `rails new` with the `--skip-active-record` option, follow Mongoid's [installation instructions](http://mongoid.org/en/mongoid/docs/installation.html). Otherwise:

    rails generate mongoid:config

Finally, run the `popolo` generator:

    rails generate popolo

## Bugs? Questions?

This engine's main repository is on GitHub: [http://github.com/opennorth/popolo](http://github.com/opennorth/popolo), where your contributions, forks, bug reports, feature requests, and feedback are greatly welcomed.

## Acknowledgements

This gem is developed by [Open North](http://www.opennorth.ca/) through a partnership with the [Participatory Politics Foundation](http://www.participatorypolitics.org/).

Copyright (c) 2012 Open North Inc., released under the MIT license
