class ArticlesController < ApplicationController

	before_action :move_to_index, except: :index

	def index
		# @articles  = Articles.includes(:user).order("id DESC").page(params[:page]).per(6)
		@articles = Article.all.page(params[:page]).per(5).order("created_at DESC")
	end

	def new
	end

	def create
		Article.create(image: article_params[:image], text: article_params[:text], user_id: current_user.id)
	end

	def destroy
		article = Article.find(params[:id])
		if article.user_id == current_user.id
			article.destroy
		end
	end

	def update
		article = Article.find(params[:id])
		if article.user_id == current_user.id
			article.update(article_params)
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	private
	def article_params
		params.permit(:image, :text)
	end

	def move_to_index
		unless user_signed_in?
		  redirect_to action: :index
		end
	end
end
