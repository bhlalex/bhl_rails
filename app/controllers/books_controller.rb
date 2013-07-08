class BooksController < ApplicationController
  def index
    @search_criteria = "*:*"
  end
end
