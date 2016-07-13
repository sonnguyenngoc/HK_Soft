json.array!(@hotels) do |hotel|
  json.extract! hotel, :id, :image_url, :name, :hotel_type, :address, :position, :area_id, :avg_price, :services, :content
  json.url hotel_url(hotel, format: :json)
end
