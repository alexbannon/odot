class TodoList < ActiveRecord::Base
  has_many :todo_items
  validates :title, presence: true, length: { in: 1..60 }
  scope :has_description, -> { where.not("description" => nil)}
end
