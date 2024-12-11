class Deliverable < ApplicationRecord
  # -----------------------------------------------
  # RELATIONSHIP
  # ------------------------------------------------
  belongs_to :user
  belongs_to :project
  has_many :comments

  # -----------------------------------------------
  # VALIDATIONS
  # ------------------------------------------------
  validates :name, :status, presence: true

  # -----------------------------------------------
  # ENUMS
  # ------------------------------------------------
  enum status: ::PROJECT_STATUSES
end
