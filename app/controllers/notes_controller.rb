class NotesController < ApplicationController
  before_action :set_note, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index
    @notes = Note.all.order(id: "DESC").page(params[:page]).per(18)

    # want が true のノートだけ取り出したい。
    # @notes = current_user.notes
    # もし @notes の中に want が true の note があれば



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
    if @note.label_ids.present?
      @labels = Label.find(@note.label_ids)
    end
    @comments = @note.comments
    @comment = @note.comments.build
    if current_user.present?
      @favorite = current_user.favorites.find_by(note_id: @note.id)
    end
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to note_path(@note.id), notice: "noteを編集しました!"
    else
      render 'edit'
    end
  end

  def destroy
    @note.destroy
    redirect_to root_path, notice:"noteを削除しました!"
  end


  private

  def note_params
    params.require(:note).permit(:fragrance_id, :content, :date, :weather, :humidity, :point, :scene, :layerd, :want, :picture, :picture_cache, label_ids: [])
  end

  def set_note
    @note = Note.find(params[:id])
  end
end
