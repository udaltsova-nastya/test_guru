# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[new create]
  before_action :find_question, only: %i[show edit update destroy]

  def show; end

  def new
    @question = @test.questions.build
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    if @question.destroy
      render plain: "Question was deleted"
    else
      render plain: "Question was not deleted"
    end
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to "/404.html"
  end

  def find_question
    @question = Question.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to "/404.html"
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
