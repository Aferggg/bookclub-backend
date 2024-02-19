class NotesController < ApplicationController
    def index
      @notes = Note.all
    end
  
    def show
      @note = Note.find(params[:id])
    end
  
    def create
      @note = Note.new(note_params)
  
      if @note.save
        render json: @note, status: :created
      else
        render json: @note.errors, status: :unprocessable_entity
      end
    end
  
    def update
      @note = Note.find(params[:id])
  
      if @note.update(note_params)
        render json: @note
      else
        render json: @note.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @note = Note.find(params[:id])
      @note.destroy
    end
  
    private
  
    def note_params
      params.require(:note).permit(:content)
    end
  end