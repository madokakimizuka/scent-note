class FavoritesController < ApplicationController


  def create
    @note = Note.find(params[:note_id])
    @favorite = current_user.favorites.create(note_id: params[:note_id])
    # @favorite = @note.favorites.build(favorite_params)
    respond_to do |format|
      if @favorite.save
        format.js { render :index }
      else
        format.html { redirect_to note_path(@note), notice: 'お気に入りできませんでした' }
      end
    end
  end
   
  def destroy
    @note = Note.find(params[:note_id])
    @favorite = current_user.favorites.find_by(id: params[:id])
    # @note = Note.find(params[:id])
    # @favorite = Favorite.find(params[:id])
    respond_to do |format|
      if @favorite.destroy
        format.js { render :index }
      else
        format.html { redirect_to note_path(@note), notice: 'お気に入りを外せませんでした'}
      end
    end
  end

end
