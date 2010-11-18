class BooksController < ApplicationController
  before_filter :need_authors
  before_filter :fetch_book_from_url, :only => [:edit, :update, :destroy]
  
  def new
    @book = flash[:book] || Book.new
  end
  
  def edit
    @book = flash[:book] || @book
  end
  
  def index
    @books = Book.all
  end
  
  def create
    @book = Book.new(params[:book])
    
    if @book.save
      redirect_to books_url
    else
      flash[:book] = @book
      redirect_to new_book_url
    end
  end
  
  def destroy
    @book.destroy    
    redirect_to books_url    
  end
  
  def update
    if @book.update_attributes(params[:book])
      redirect_to books_url    
    else
      flash[:book] = @book
      redirect_to edit_book_url(@book)
    end
  end
  
  private
  def need_authors
    if Author.count == 0
      flash[:notice] = "Add some authors first"
      redirect_to new_author_url
    end
  end
    
  def fetch_book_from_url
    @book = Book.find(params[:id])
  end
end
