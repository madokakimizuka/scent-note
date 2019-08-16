class NotesController < ApplicationController
  before_action :set_note, only: %i[show edit update destroy]

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      redirect_to note_path(@note.id), notice:"note を作成しました!"
    else
      render 'new'
    end
  end

  def show
    @note = Note.find(params[:id])
  end

  def edit
  end

  def update
  if @note.update(note_params)
    redirect_to root_path, notice: "タスクを編集しました!"
  else
    render 'edit'
  end
end

def destroy
  @note.destroy
  redirect_to root_path, notice:"タスクを削除しました!"
end


  private

  def note_params
    params.require(:note).permit(:fragrance_id, :content, :date, :weather, :humidity, :point, :scene, :layerd, :want, :image)
  end

  def set_note
    @note = current_user.notes.find(params[:id])
  end
end
