json.array!(@booking_hotels) do |booking_hotel|
  json.extract! booking_hotel, :id, :full_name, :phone, :email, :date_from, :date_to, :adult, :child, :room_number, :hotel_room_id, :hotel_room_name, :price
  json.url booking_hotel_url(booking_hotel, format: :json)
end
