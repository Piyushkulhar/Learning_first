# config/initializers/ransack_active_storage.rb

Rails.application.config.to_prepare do
    # Use ActiveSupport::Dependencies to ensure ActiveStorage is loaded
    ActiveSupport.on_load(:active_storage_attachment) do
      ActiveStorage::Attachment.class_eval do
        def self.ransackable_attributes(auth_object = nil)
          ["blob_id", "created_at", "id", "name", "record_id", "record_type"]
        end
      end
    end
  end
  