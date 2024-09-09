ActiveAdmin.register Account do
    # Permit parameters to be updated via ActiveAdmin forms
    permit_params :first_name, :last_name, :email, :date_of_birth, :image
  
    # Customize the form for creating and editing accounts
    form do |f|
      f.inputs do
        f.input :first_name
        f.input :last_name
        f.input :email
        f.input :date_of_birth
        f.input :image, as: :file # For image upload
      end
      f.actions
    end
  
    # Customize the index page
    index do
        selectable_column
        id_column
        column :first_name
        column :last_name
        column :email
        column :date_of_birth
        column :image do |account|
          if account.image.attached?
            image_tag account.image, alt: 'Account Image', size: '100x100'
          end
        end
        actions
    end
      
  
    # Customize the show page
    show do
      attributes_table do
        row :first_name
        row :last_name
        row :email
        row :date_of_birth
        row :image do |account|
          # image_tag rails_blob_path(account.image, only_path: true)
          image_tag rails_blob_path(account.image, only_path: true), style: "max-width: 200px; height: auto; border: 1px solid #ddd; padding: 5px;"
        end
      end
    end
  end
  