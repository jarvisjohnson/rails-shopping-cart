# README

- `products.json` dropped into `lib` folder

- Products are imported via rake task `products:import_from_json`

# Setup
1. start rails: `bundle install && rails db:setup` (need to update config/database.yml first)
2. import products: `rake products:import_from_json`
3. `rails s`
4. basic tests: `rails test` (need to extend these to test the actual cart functionality / discounts)