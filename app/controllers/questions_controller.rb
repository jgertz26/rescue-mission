class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @question = Question.find(params['id'])
    @answer = Answer.new
    @answers = @question.answers.order(created_at: :asc)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = "Well done"
      redirect_to @question
    else
      flash[:notice] = @question.errors.full_messages.join(" - ")
      render action: 'new'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to "/questions"
  end

  private

  def question_params
    params.require(:question).permit(:body, :description)
  end
end
