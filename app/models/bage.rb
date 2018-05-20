class Bage < ApplicationRecord
  has_many :users_bages
  has_many :bages, through: :users_bages

  validates :name, presence: true
  validates :url, presence: true
  validates :name, uniqueness: true
end
