json.array!(@galleries) do |gallery|
  json.extract! gallery, :id, :image_url, :title, :description
  json.url gallery_url(gallery, format: :json)
end
