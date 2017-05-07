class TodoItem < ActiveRecord::Base
  belongs_to :todo_list

  validates :content, presence: true, length: {in: 2..255}
  
end
