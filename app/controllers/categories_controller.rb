class CategoriesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	load_and_authorize_resource

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
		@categories = Category.all
	end
	def create
		@category = Category.new(params[:category].permit(:name,:description))
		if @category.save
			redirect_to categories_path
		else
			render action: "new"
		end
	end

	def show
		@category = Category.find(params[:id])

	end

	def edit
		@category = Category.find(params[:id])
		@categories = Category.all
	end

	def update
		@category = Category.find(params[:id])
		if @category.update_attributes (params[:category].permit(:name,:description))
			redirect_to categories_path
		else
			render action: "edit"
		end
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to categories_path
	end





end
