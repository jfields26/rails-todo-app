json.extract! todo, :id, :title, :priority, :completed, :user_id, :category_id, :created_at, :updated_at
json.url todo_url(todo, format: :json)
