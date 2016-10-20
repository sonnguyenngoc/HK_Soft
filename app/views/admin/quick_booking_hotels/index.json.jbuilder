json.array!(@quick_booking_hotels) do |quick_booking_hotel|
  json.extract! quick_booking_hotel, :id, :name, :phone, :email, :passport, :hotel_name, :location, :date_from, :date_to, :number, :adult, :child, :message
  json.url quick_booking_hotel_url(quick_booking_hotel, format: :json)
end
