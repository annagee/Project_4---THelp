class CommentsController < ApplicationController

 def create
  @question = Question.find(params[:question_id])
  @comment = @question.comments.create(params[:comment].permit(:comment))
  @comment.user_id = current_user.id if current_user

  if @comment.save
    redirect_to question_path(@question)
  else
    render 'new'
  end
 end
end
