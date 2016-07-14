json.array!(@program_languages) do |program_language|
  json.extract! program_language, :id, :name, :description
  json.url program_language_url(program_language, format: :json)
end
