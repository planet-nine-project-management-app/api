class Project < ApplicationRecord
  # -----------------------------------------------
  # RELATIONSHIP
  # ------------------------------------------------
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :deliverables
  belongs_to :company

  # -----------------------------------------------
  # VALIDATIONS
  # ------------------------------------------------
  validates :name, :status, presence: true

  # -----------------------------------------------
  # ENUMS
  # ------------------------------------------------
  enum status: ::PROJECT_STATUSES
end
