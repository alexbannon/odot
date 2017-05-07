class TodoItem < ActiveRecord::Base
  belongs_to :todo_list

  validates :content, presence: true, length: {in: 2..255}

  def self.complete
    where("completed_at is not null")
  end

  def self.incomplete
    where(completed_at: nil)
  end

  def completed?
    !completed_at.blank?
  end

  def toggle_completion!
    if completed?
      update_attribute(:completed_at, nil)
    else
      update_attribute(:completed_at, Time.now)
    end
  end
end
