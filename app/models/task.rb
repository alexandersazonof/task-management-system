class Task < ApplicationRecord
  include RailsSortable::Model
  set_sortable :sort
  belongs_to :user

  validates :name, presence: true, length: { in: 4..10  }

  def sortable_id
    "Task_#{self.id}"
  end

end
