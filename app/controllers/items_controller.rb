class ItemsController < ApplicationController
	respond_to :json

	def index
		render json: current_user.items
	end

	def create
		item = Item.new(item_params)
		item.user_id = current_user.id
		if item.save
			render json: item
		else
			render json: item.errors.full_messages, status: :unprocessable_entity
		end
	end

	def update
		item = Item.find(params[:id])
		if item.update_attributes!(item_params)
			render json: item
		else
			render json: item.errors.full_messages, status: :unprocessable_entity
		end
	end

	def destroy
		item = Item.find(params[:id])
    if item.destroy!
      render json: item
    else
      render json: item.errors.full_messages, status: :unprocessable_entity
    end
	end

	private
  
  def item_params
    params.required(:item).permit(:name, :checked, :editing, :category, :default, :necessity)
  end
end
