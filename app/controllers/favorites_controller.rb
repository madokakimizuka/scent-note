class FavoritesController < ApplicationController
  def create
    @like = Favorite.create(user_id: current_user.id, note_id: params[:post_id])
    @likes = Like.where(note_id: params[:note_id])
    @note.reload
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    @favorites = Favorite.where(note_id: params[:note_id])
    @note.reload
  end

  private

  def set_note
    @note = Note.find(params[:note_id])
  end
end
