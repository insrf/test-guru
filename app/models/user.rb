class User < ApplicationRecord

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"

  validate :validate_email
  validates :email, uniqueness: true

  has_secure_password

  EMAIL = /^[-\w.]+@([A-z0-9][-A-z0-9]+\.)+[A-z]{2,4}$/

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  private

  def validate_email
    errors.add(:email) if self.email !~ EMAIL
  end
end
