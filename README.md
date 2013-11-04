# Sequential
[![Build Status](https://travis-ci.org/austinylin/sequential.png?branch=master)](https://travis-ci.org/austinylin/sequential)

Generates scoped, threadsafe sequences for ActiveRecord models.

Based on [Sequenced](https://github.com/djreimer/sequenced) by 
[Derrick Reimer](https://github.com/djreimer)

## Installation

Add this line to your application's Gemfile:

    gem 'sequential'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sequential

## Usage

Setup the database table:

    rails g sequential:setup

Add a column to your model to hold the sequence (by default sequential_id)
, in a migration:

    add_column :model_name, :sequential_id, :integer

Then run the migrations:

    rake db:migrate

Now add the following to your model:

    sequential scope: :name_of_attribute_to_scope_on

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
