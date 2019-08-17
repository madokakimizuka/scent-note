class Admin::FragrancesController < ApplicationController
  def index
    @fragrances = Fragrance.all
  end

  def new
    @fragrances = Fragrance.new
  end

  def create
    @fragrance = current_user.notes.build(note_params)
    if @fragrance.save
      redirect_to note_path(@fragrance.id), notice:"note を作成しました!"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
  if @fragrance.update(note_params)
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
    params.require(:fragrance).permit(:fragrance_id, :content, :date, :weather, :humidity, :point, :scene, :layerd, :want, :image)
  end

  def set_note
    @note = current_user.notes.find(params[:id])
  end
end
