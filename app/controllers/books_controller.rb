class BooksController < ApplicationController
    def index
      @books = Book.all
    end
  
    def show
      @book = Book.find(params[:id])
    end
  
    def create
      @book = Book.new(book_params)
  
      if @book.save
        render json: @book, status: :created
      else
        render json: @book.errors, status: :unprocessable_entity
      end
    end
  
    def update
      @book = Book.find(params[:id])
  
      if @book.update(book_params)
        render json: @book
      else
        render json: @book.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @book = Book.find(params[:id])
      @book.destroy
    end
  
    private
  
    def book_params
      params.require(:book).permit(:title, :author)
    end
  end