# lib/tasks/import_products.rake

namespace :products do
  desc "This imports products from files"

  task import_from_json: :environment do
    puts "Import from a json file"

    @products = JSON.parse(
      File.read('lib/products.json')
    )

    @products.each do |product|
      new_product = Product.create(
        uuid: product['uuid'],
        name: product['name'],
        price: product['price'],
      )
      puts "Imported product #{new_product.name}"
    end
  end
end
