json.array!(@booking_cars) do |booking_car|
  json.extract! booking_car, :id, :full_name, :address, :phone, :email, :date_from, :date_to, :address_from, :address_to
  json.url booking_car_url(booking_car, format: :json)
end
