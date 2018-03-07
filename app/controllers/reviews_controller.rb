class ReviewsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	load_and_authorize_resource


	def index
		@reviews = Review.all
	end
	def show 

		@review = Review.find(params[:id])

	end	

	def create 
		@review = Review.new(review_params)
		@review.user_id = current_user.id 
		binding.pry
		if @review.save
			binding.pry
			redirect_to article_path(@review.article.id)
		end
	end


	def edit
		@review = Review.find(params[:id])
	end

	def update
		@review = Review.find(params[:id])
		if @review.update_attributes (review_params)
			redirect_to article_path(@review.article.id)
		else
			render action: "edit"
		end
	end

	def destroy
		@review = Review.find(params[:id])
		if @review.destroy 
		redirect_to article_path(@review.article.id)
		end 
	end

	private

	def review_params
		params.require(:review).permit(:body,:article_id,:rating)
	end

end
