class Project < ApplicationRecord
  belongs_to :user
  has_many :deliverables

  validates :name, presence: true
end
