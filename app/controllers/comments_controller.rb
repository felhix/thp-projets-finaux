class CommentsController < ApplicationController
  before_action :authenticate_user!
  $message_deadline = 'La deadline est passée'

  def create
    if datetimevalidator(DateValidation.last)
    commentable = commentable_type.constantize.find(commentable_id)
    @comment = Comment.build_from(commentable, current_user.id, body)

      if @comment.save
        make_child_comment
        flash[:success] = "Comment was successfully saved !"
        redirect_back(fallback_location: root_path)
      else
        flash[:danger] = @comment.errors.full_messages.to_sentence
        redirect_back(fallback_location: root_path)
      end 
      else
      flash[:danger] = $message_deadline
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    if datetimevalidator(DateValidation.last)
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
		  format.js 
    end

    end
  end


  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type, :comment_id)
  end

  def commentable_type
    comment_params[:commentable_type]
  end

  def commentable_id
    comment_params[:commentable_id]
  end

  def comment_id
    comment_params[:comment_id]
  end

  def body
    comment_params[:body]
  end

  def make_child_comment
    return "" if comment_id.blank?

    parent_comment = Comment.find comment_id
    @comment.move_to_child_of(parent_comment)
  end

end
