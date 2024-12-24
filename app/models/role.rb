class Role < ApplicationRecord
  # -----------------------------------------------
  # RELATIONSHIP
  # ------------------------------------------------
  belongs_to :user
end
