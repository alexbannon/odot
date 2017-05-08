class TodoList < ActiveRecord::Base
  has_many :todo_items
  validates :title, presence: true, length: { in: 1..60 }
  validates :description, length: { in: 0..120 }
  scope :has_description, -> { where.not("description" => nil)}
end
