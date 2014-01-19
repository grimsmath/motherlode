json.array!(@nuggets) do |nugget|
  json.extract! nugget, :id, :title, :body
  json.url nugget_url(nugget, format: :json)
end
