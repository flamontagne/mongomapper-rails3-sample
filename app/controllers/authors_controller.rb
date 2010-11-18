class AuthorsController < ApplicationController
  before_filter :fetch_author_from_url, :only => [:edit, :update]
  
  def new
    @author = flash[:author] || Author.new
  end
  
  def edit
    @author = flash[:author] || @author
  end
  
  def index
    @authors = Author.all
  end
  
  def create
    @author = Author.new(params[:author])
    
    if @author.save
      redirect_to authors_url
    else
      flash[:author] = @author
      redirect_to new_author_url
    end
  end
  
  def update
    if @author.update_attributes(params[:author])
      redirect_to authors_url    
    else
      flash[:author] = @author
      redirect_to edit_author_url(@author)
    end
  end
  
  private
    
  def fetch_author_from_url
    @author = Author.find(params[:id])
  end
end
