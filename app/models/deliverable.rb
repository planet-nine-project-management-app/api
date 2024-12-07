class Deliverable < ApplicationRecord
  belongs_to :project

  validates :name, :due_date, presence: true
end
