class BooksController < ApplicationController
  def index
    @books = Book.all
    render json: @books
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    respond.json do |format|
      if @book.save
        format.json { render json: @book }
      else
        format.json { render json: { errors: @book.errors.as_json }, status: 420 }
      end
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :category)
  end
end
