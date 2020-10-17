class User < ApplicationRecord
  has_many :items
  has_many :purchasers

  with_options presence: true do
    validates :nickname
    validates :birthday
    
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
      validates :first_name  
      validates :last_name
    end

    with_options format: { with: /\A[ァ-ン]+\z/ } do
      validates :first_name_kana
      validates :last_name_kana
    end
    
  end
  validates :password, format: { with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/ }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
