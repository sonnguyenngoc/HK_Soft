json.array!(@booking_planes) do |booking_plane|
  json.extract! booking_plane, :id, :full_name, :email, :phone, :address, :adult, :child, :seat_number, :date_from, :date_to, :ticket_type, :address_from, :address_to, :message
  json.url booking_plane_url(booking_plane, format: :json)
end
