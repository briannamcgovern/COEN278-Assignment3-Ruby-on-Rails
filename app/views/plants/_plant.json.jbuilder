json.extract! plant, :id, :name, :size, :description, :image_url, :created_at, :updated_at
json.url plant_url(plant, format: :json)
