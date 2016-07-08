json.array!(@booking_visas) do |booking_visa|
  json.extract! booking_visa, :id, :full_name, :email, :phone, :address, :passport, :cmnd_number, :date_of_issue, :place_of_issue, :country_to, :visa_type
  json.url booking_visa_url(booking_visa, format: :json)
end
