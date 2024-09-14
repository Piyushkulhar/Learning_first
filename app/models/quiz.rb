class Quiz < ApplicationRecord
    belongs_to :account
    has_many :answers, dependent: :destroy
    accepts_nested_attributes_for :answers, allow_destroy: true  
end
