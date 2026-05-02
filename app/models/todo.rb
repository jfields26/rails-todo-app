class Todo < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :category, presence: { message: "must be selected (ToDos require a category)" }
end
