class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(note_id: params[:note_id])
    redirect_to note_path(favorite.note.id), notice: "#{favorite.note.user.name}さんのノートをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to note_path(favorite.note.id), notice: "#{favorite.note.user.name}さんのノートをお気に入り解除しました"
  end
end
