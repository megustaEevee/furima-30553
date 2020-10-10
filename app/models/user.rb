class User < ApplicationRecord
  has_many :items
  has_many :purchasers

  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ン]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ン]+\z/ }
  validates :birthday, presence: true
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
