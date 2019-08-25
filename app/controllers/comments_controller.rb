class CommentsController < ApplicationController
  def create
    @note = Note.find(params[:note_id])
    @comment = @note.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to note_path(@note), notice: '投稿できませんでした...' }
      end
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @comment = Comment.find(params[:note_id])
    @comment.destroy
    redirect_to note_path(@note.id), notice:"コメントを削除しました!"
  end

  private

  def comment_params
    params.require(:comment).permit(:blog_id, :content)
  end
end
