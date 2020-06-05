class SearchController < ApplicationController

def search
	@search_word = params[:search_word]
         if params[:search_type] == 'Users'
             case params[:search_method]
	             when 'perfect_match' then
	                 @models = User.where("#{params[:search_word]}")
	             when "forward_match" then
	                 @models = User.where("name LIKE?","#{params[:search_word]}%")
	             when "backend_match" then
	                 @models = User.where("name LIKE?","%#{params[:search_word]}")
	             when "partial_match" then
	                 @models = User.where("name LIKE?","%#{params[:search_word]}%")
             end

         elsif params[:search_type] == 'Books'
             case params[:search_method]
	             when 'perfect_match' then
	                 @models = Book.where("#{params[:search_word]}")
	             when "forward_match" then
	                 @models = Book.where("title LIKE?","#{params[:search_word]}%")
	             when "backend_match" then
	                 @models = Book.where("title LIKE?","%#{params[:search_word]}")
	             when "partial_match" then
	                 @models = Book.where("title LIKE?","%#{params[:search_word]}%")
             end
         end
     end

 end


# 空欄でやると全て表示される
# 全部一致しない場合の対策
