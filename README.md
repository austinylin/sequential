# SequentialId

Generates scoped, threadsafe sequential ids for ActiveRecord models.

Based on [Sequenced](https://github.com/djreimer/sequenced) by 
[Derrick Reimer](https://github.com/djreimer)

## Installation

Add this line to your application's Gemfile:

    gem 'sequential_id'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sequential_id

## Usage

Setup the database table:

    rails g sequential_id:setup

Add a column to your model to hold the sequential id, in a migration:

    add_column :model_name, :sequential_id, :integer

Then run the migrations:

    rake db:migrate

Now add the following to your model:

    has_sequential_id scope: :name_of_attribute_to_scope_on

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
