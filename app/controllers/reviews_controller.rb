class ReviewsController < ApplicationController


	def index
		@reviews = Review.all
	end
	def show 

		@review = Review.find(params[:id])

	end	

	def create 
		@review = Review.new(params[:review].permit(:body,:article_id,:rating)) 
		if @review.save
			redirect_to article_path(@review.article.id)
		
		end
	end


	def edit
		@review = Review.find(params[:id])
	end

	def update
		@review = Review.find(params[:id])
		if @review.update_attributes (params[:review].permit(:body,:article_id,:rating))
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



end
