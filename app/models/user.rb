class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :messages, dependent: :destroy
         has_many :jobs, dependent: :destroy


  def full_name
    "#{first_name} #{last_name}"
  end

  def to_s
    full_name
  end

  def active_for_authentication? 
    super && approved?
  end 
    
  def inactive_message 
    approved? ? super : :not_approved
  end
  
end
