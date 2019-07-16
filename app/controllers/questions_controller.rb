class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]

  def index
    render plain: @test.questions.pluck(:body).join("\n")
  end

  def show
    render plain: @question.body
  end

  def new; end

  def create
    question = test.questions.create!(qustion_params)
    render plain: "Question created: #{question.body}"
  end

  def destroy
    @question.destroy
  end

  private

  def find_test
    @test = Test.find(test_id)
  rescue ActiveRecord::RecordNotFound => e
    redirect_to "/404.html"
  end

  def find_question
    @question = Question.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to "/404.html"
  end

  def test_id
    params[:test_id]
  end

  def qustion_params
    params.require(:question).permit(:body)
  end
end
