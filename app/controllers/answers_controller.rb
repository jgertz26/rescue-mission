class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)

    if @answer.save
      flash[:notice] = "Well done"
      redirect_to question_path(@question)
    else
      flash[:error] = @answer.errors.full_messages.join(" - ")
      render :'questions/show'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:description)
  end
end
