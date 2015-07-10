class QuestionsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
   @question = Question.all.order("created_at DESC")
  end

  def show
  
     
  end

  def new
    @question = current_user.questions.build
  end


  def create
    @question = current_user.questions.build(question_params)

    if @question.save
      redirect_to @question
    else
      render 'new'
  end
end 

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end
  
  def destroy
    @question.destroy
    redirect_to root_path

  end


  private

  def find_post
    @question = Question.find(params[:id])
  end 

  def question_params
    params.require(:question).permit(:title, :content, :all_tags)
  end
end
