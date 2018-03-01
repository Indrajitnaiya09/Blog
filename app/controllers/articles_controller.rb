class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]


	def index
		@articles = Article.all
	end
	def new
		@article = Article.new
	end
	def create
		@article = Article.new(article_params)
		if @article.publish_date <= Date.today
			@article.is_published = true
		else
			@article.is_published = false
		end
				

		if @article.save
			redirect_to articles_path
		else
			render action: "new"
		end
	end

	def show
 
		@review = Review.new
	end

	def edit

	end

	def update
		if @article.update_attributes (article_params)
			redirect_to articles_path(@article.id)
		else
			render action: "edit"
		end
	end

	def destroy
		@article.destroy
		redirect_to articles_path
	end



private

	def article_params

		params[:article].permit(:title,:body,:is_published,:publish_date,:feature_image_url,:category_id,:slug)
	end


	def set_article
			@article = Article.find(params[:id])
	end




end
