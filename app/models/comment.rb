class Comment < ApplicationRecord
  belongs_to  :tweet   # Association with tweets table
  belongs_to  :user   # Association with users table
  # We define an association by stating that a comment belongs to one user and one Tweet .
end
