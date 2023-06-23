class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:username]
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  def email_required?
    false
  end
end
