ActiveAdmin.register Account do
  permit_params :first_name, :last_name, :email, :date_of_birth, :image

  controller do
    before_action :check_permissions, except: [:index, :show] if -> { current_admin_user.manager? }

    private

    def check_permissions
      if current_admin_user.manager? && !%w[index show].include?(action_name)
        redirect_to admin_accounts_path, alert: "You are not authorized to access this page."
      elsif current_admin_user.admin?
        # Admins have access to all actions
      else
        redirect_to admin_dashboard_path, alert: "You are not authorized to access this page."
      end
    end
  end

  # Remove default 'New' button
  config.remove_action_item :new

  # Conditionally add 'New' button
  action_item :new, only: :index do
    if current_admin_user.admin?
      link_to 'New Account', new_admin_account_path, class: 'button'
    end
  end

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
    actions # Shows default actions like Show, Edit for each record
  end

  # Customize the show page
  show do
    attributes_table do
      row :first_name
      row :last_name
      row :email
      row :date_of_birth
      row :image do |account|
        image_tag rails_blob_path(account.image, only_path: true), style: "max-width: 200px; height: auto; border: 1px solid #ddd; padding: 5px;" if account.image.attached?
      end
    end
  end
end
