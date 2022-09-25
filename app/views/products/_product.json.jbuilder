json.extract! product, :id, :title, :price, :description, :brand, :created_at, :updated_at
json.url product_url(product, format: :json)
