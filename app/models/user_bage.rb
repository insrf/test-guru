class UserBage < ApplicationRecord
  belongs_to :user
  belongs_to :bage

  validates :user_id, uniqueness: { scope: :bage_id }

end
