# # lib/active_storage_ransack_railtie.rb

# require 'rails/railtie'

# module ActiveStorageRansack
#   class Railtie < Rails::Railtie
#     initializer "active_storage_ransack.configure_rails_initialization" do
#       ActiveSupport.on_load(:active_record) do
#         if defined?(ActiveStorage::Attachment)
#           class ActiveStorage::Attachment < ApplicationRecord
#             def self.ransackable_attributes(auth_object = nil)
#               ["blob_id", "created_at", "id", "name", "record_id", "record_type"]
#             end
#           end
#         end
#       end
#     end
#   end
# end
