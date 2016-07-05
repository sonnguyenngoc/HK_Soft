json.array!(@cars) do |car|
  json.extract! car, :id, :image_url, :name, :price, :description, :content, :manufacturer_id, :article_category_id
  json.url car_url(car, format: :json)
end
