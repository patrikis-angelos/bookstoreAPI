class BooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @books = Book.all
    render json: @books
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      render json: @book
    else
      render json: {error: 'You have to provide a valid book format'}, status: 400
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    render json: {confirm: 'Book removed succesfully'}, status: 200
  end

  private

  def book_params
    params.require(:book).permit(:title, :category)
  end
end
