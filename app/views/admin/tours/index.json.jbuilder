json.array!(@tours) do |tour|
  json.extract! tour, :id, :type, :name, :is_sale, :discount_percent, :new_price, :old_price, :services, :duration, :position, :hotel, :transportation
  json.url tour_url(tour, format: :json)
end
