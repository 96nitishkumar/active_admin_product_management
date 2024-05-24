class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  has_one_attached :image       

  has_many :orders, class_name: 'Order'

  # enum status: ["dissable", "enable"]
  enum status: { enabled: 0, disabled: 1 }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "id", "location", "mobile_number", "name", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end
  
  scope :all_users, -> {where(name:"NItish kumar")}
end
