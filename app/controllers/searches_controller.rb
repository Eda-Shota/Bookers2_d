class SearchesController < ApplicationController
  before_action :authenticate_user!
  def search
    @word = params[:word]
    @range = params[:range]
    if @range == "User"
      @users = User.looks(params[:search], params[:word])
      render "/searches/search_lists.html"
    else
      @books = Book.looks(params[:search], params[:word])
      render "/searches/search_lists.html"
    end
  end

  def search_book
    @book=Book.new
    @books = Book.search(params[:category])
    render "/searches/search_lists.html"
  end
end
