json.array!(@projects) do |project|
  json.extract! project, :id, :image_url, :author, :name, :start_date, :end_date, :description, :website
  json.url project_url(project, format: :json)
end
