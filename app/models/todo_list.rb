class TodoList < ActiveRecord::Base
  validates :title, presence: true, length: { in: 1..60 }
  scope :has_description, -> { where.not("description" => nil)}
end
