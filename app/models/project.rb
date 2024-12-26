class Project < ApplicationRecord
  # -----------------------------------------------
  # RELATIONSHIP
  # ------------------------------------------------
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :deliverables
  belongs_to :company
  has_many_attached :attachments # Active Storage
  has_many :images, as: :imageable, dependent: :destroy # Polymorphic association

  accepts_nested_attributes_for :images, allow_destroy: true

  # -----------------------------------------------
  # VALIDATIONS
  # ------------------------------------------------
  validates :name, :status, presence: true

  # -----------------------------------------------
  # ENUMS
  # ------------------------------------------------
  enum status: ::PROJECT_STATUSES
end
