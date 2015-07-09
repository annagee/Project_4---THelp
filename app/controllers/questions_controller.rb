class QuestionsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
     
  end

  def new
    @question = Question.new
  end


  def create
    @question = Question.new(question_params)

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
    params.require(:question).permit(:title, :content)
  end
end
