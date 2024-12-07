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

  validate :age_must_be_at_least_18, if: -> { date_of_birth.present? }

  private

  # Check if the age is at least 18
  def age_must_be_at_least_18
    if date_of_birth > 18.years.ago
      errors.add(:date_of_birth, "You must be at least 18 years old.")
    end
  end

end
