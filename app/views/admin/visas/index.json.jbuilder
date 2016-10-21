json.array!(@visas) do |visa|
  json.extract! visa, :id, :title_1, :content_1, :title_2, :content_2, :title_3, :content_3, :title_4, :content_4, :title_5, :content_5, :title_6, :content_6
  json.url visa_url(visa, format: :json)
end
