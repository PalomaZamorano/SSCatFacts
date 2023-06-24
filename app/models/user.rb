class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:username]
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  has_and_belongs_to_many :fact_cats

  def email_required?
    false
  end
end
