class ShelvesController < ApplicationController
    def index
      @shelves = Shelf.all
    end
  
    def show
      @shelf = Shelf.find(params[:id])
    end
  
    def create
      @shelf = Shelf.new(shelf_params)
  
      if @shelf.save
        render json: @shelf, status: :created
      else
        render json: @shelf.errors, status: :unprocessable_entity
      end
    end
  
    def update
      @shelf = Shelf.find(params[:id])
  
      if @shelf.update(shelf_params)
        render json: @shelf
      else
        render json: @shelf.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @shelf = Shelf.find(params[:id])
      @shelf.destroy
    end
  
    private
  
    def shelf_params
      params.require(:shelf).permit(:name)
    end
  end