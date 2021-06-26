class SearchesController < ApplicationController
  def search
		@content = params[:content]
		@method = params[:method]
	  @records = Post.search_for(@content, @method).page(params[:page]).reverse_order
	  @user = current_user
	  @prefectures = Prefecture.all
  end
end
