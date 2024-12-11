class Comment < ApplicationRecord
  # -----------------------------------------------
  # RELATIONSHIP
  # ------------------------------------------------
  belongs_to :user
  belongs_to :deliverable

  # -----------------------------------------------
  # VALIDATIONS
  # ------------------------------------------------
  validates :content, presence: true
end
