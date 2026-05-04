# Jarred Fields

module ApplicationHelper
  def back_path_from_origin(todo, origin)
    case origin
    when "completed"
      completed_todos_path
    when "category"
      category_path(todo.category)
    else
      todos_path
    end
  end
end
