# frozen_string_literal: true

class AnswersController < ApplicationController # rubocop:disable Style/Documentation
  before_action :set_answer!, only: %i[destroy]

  def create
    @answer = @question.answers.build answer_params

    if @answer.save
      flash[:success] = 'Answer created!'
      redirect_to question_path(@answer.question)
    else
      @answers = Answer.order created_at: :desc
      render 'questions/show'
    end
  end

  def destroy
    @answer = @question.answers.find params[:id]
    @answer.destroy
    flash[:success] = 'Answer deleted!'
    redirect_to question_path(@answer.question)
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def set_answer!
    @answer = Answer.find params[:id]
  end
end
