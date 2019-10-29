# README

- `products.json` dropped into `lib` folder

- Product model generated with `rails g scaffold Products name:string, uuid:integer:unique price:decimal`, uuid set as unique key

- Products are imported via rake task `products:import_from_json`

# Setup
1. `rails db:setup`
2. `rake products:import_from_json`
3. `rails s`
4. basic tests: `rails test`