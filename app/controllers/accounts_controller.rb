class AccountsController < ApplicationController
	skip_before_action :verify_authenticity_token
  
	def create
	  account = Account.new(account_params)

	  if account.save
		# render json: AccountSerializer.new(account).serializable_hash, status: :ok
		render json: {account: account, image: url_for(account.image)} 
	  else
		render json: { errors: account.errors.full_messages }, status: :unprocessable_entity
	  end
	end
  
	private
  
	def account_params
	  params.permit(:first_name, :image)
	end
end

###___________Implement Locale__________________###
# class AccountsController < ApplicationController
# 	skip_before_action :verify_authenticity_token
	
# 	def create
# 	  account = Account.new(account_params)
# 	  if account.save
# 		render json: { account: account, message: I18n.t('account.create.success') }, status: :ok
# 	  else
# 		render json: { errors: account.errors.full_messages, message: I18n.t('account.create.error') }, status: :unprocessable_entity
# 	  end
# 	end
	
# 	private
	
# 	def account_params
# 	  params.permit(:first_name, :image)
# 	end
# end
