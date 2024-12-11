class Company < ApplicationRecord
  # -----------------------------------------------
  # RELATIONSHIPS
  # ------------------------------------------------
  has_many :projects
  has_many :users, through: :projects

  # -----------------------------------------------
  # VALIDATIONS
  # ------------------------------------------------
  validates :name, presence: true
end
