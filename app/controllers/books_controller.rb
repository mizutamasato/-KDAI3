class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
  end

  def show
  end

  def edit
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
      flash[:success]="successfullyしました"
    else
      @books=Book.all
      @user = current_user
      render :index
    end
  end
  
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
