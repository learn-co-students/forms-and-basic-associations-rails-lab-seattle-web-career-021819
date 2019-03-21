class NotesController < ApplicationController
  before_action :set_songs, only: [:show, :edit, :update, :destroy]
  def index
    @notes = Note.all
  end

  def show
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to @note
    else
      render :new
    end
  end

  def edit
  end

  def update
    @note.update(note_params)
    if @note.save
      redirect_to @note
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    flash[:notice] = "Note deleted."
    redirect_to notes_path
  end

  private

  def set_songs
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:content, :song_title)
  end
end
