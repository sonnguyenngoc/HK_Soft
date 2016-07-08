json.array!(@booking_tours) do |booking_tour|
  json.extract! booking_tour, :id, :full_name, :address, :phone, :email, :passport, :tour_schedule_id, :adult, :child, :message, :tour_id, :tour_name, :price
  json.url booking_tour_url(booking_tour, format: :json)
end
