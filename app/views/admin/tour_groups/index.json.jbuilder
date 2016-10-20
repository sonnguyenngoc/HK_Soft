json.array!(@tour_groups) do |tour_group|
  json.extract! tour_group, :id, :tour_name, :number, :date_from, :date_to, :price, :message, :address_from
  json.url tour_group_url(tour_group, format: :json)
end
