class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
   def create
 
    @question = Question.find(params[:question_id])
    @comment = @question.comments.create(params[:comment].permit(:comment))
    @comment.user_id = current_user.id if current_user
    @comment.save
  


    if @comment.save
      redirect_to question_path(@question)
    else
      render 'new'
    end
   end

   def edit
   @question = Question.find(params[:question_id])
   @comment = @question.comments.find(params[:id])
   end

   def update
    @question = Question.find(params[:question_id])
    @comment = @question.comments.find(params[:id])

    if @comment = @question.comments.find(params[:id])
      redirect_to question_path(@question)
     else
      render 'edit'
    end  
   end


   def destroy
    @question = Question.find(params[:question_id])
    @comment = @question.comments.find(params[:id])
    @comment.destroy
    redirect_to question_path(@question)
   end
end
