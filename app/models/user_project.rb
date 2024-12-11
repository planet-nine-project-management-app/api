class UserProject < ApplicationRecord
  # -----------------------------------------------
  # RELATIONSHIPS
  # ------------------------------------------------
  belongs_to :user
  belongs_to :project
end
