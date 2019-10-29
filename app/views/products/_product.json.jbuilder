json.extract! product, :name, :uuid, :price, :created_at, :updated_at
json.url product_url(product, format: :json)
