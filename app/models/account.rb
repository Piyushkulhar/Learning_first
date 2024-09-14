# app/models/account.rb
class Account < ApplicationRecord
  has_one_attached :image
  # def self.ransackable_attributes(auth_object = nil)
  #   ["created_at", "email", "first_name", "id", "id_value", "last_name", "updated_at"]
  # end

  # def self.ransackable_associations(auth_object = nil)
  #   ["image_attachment", "image_blob"] # Adjust if you have other associations
  # end
  def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "first_name", "date_of_birth", "last_name", "email", "id", "id_value", "last_name", "updated_at"]
  end
end
