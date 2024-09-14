class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: { admin: 'admin', manager: 'manager', editor: 'editor' }

  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  def self.ransackable_attributes(auth_object = nil)
    %w[email role created_at updated_at] # List attributes you want to be searchable
  end


  def manager?
    role == 'manager'
  end

  def admin?
    role == 'admin'
  end
end
