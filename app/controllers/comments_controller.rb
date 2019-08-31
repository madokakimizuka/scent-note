class CommentsController < ApplicationController
  def create
    @note = Note.find(params[:note_id])
    @comment = @note.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to note_path(@note), notice: '投稿できませんでした...' }
      end
    end
  end

  def edit
    @note = Note.find(params[:note_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @note = Note.find(params[:note_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to note_path(@note.id), notice: "commentを編集しました!"
    else
      render 'edit'
    end
  end

  def destroy
    @note = Note.find(params[:note_id])
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.destroy
        format.js { render :index }
      else
        format.html { redirect_to note_path(@note), notice: '投稿できませんでした...' }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:note_id, :content)
  end
end
