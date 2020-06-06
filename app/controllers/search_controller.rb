class SearchController < ApplicationController
before_action :authenticate_user!

def search
	@search_word = params[:search_word]
         if params[:search_type] == 'Users'
             case params[:search_method]
	             when 'perfect_match' then
	                 @models = User.where("name LIKE?","#{params[:search_word]}")
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
	                 @models = Book.where("title LIKE?","#{params[:search_word]}")
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


