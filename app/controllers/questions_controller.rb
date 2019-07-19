class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]

  def index
    render plain: @test.questions.pluck(:body).join("\n")
  end

  def show
    render plain: @question.body
  end

  def new
    @question = @test.questions.build
  end

  def create
    @question = @test.questions.new(qustion_params)
    if @question.save
      redirect_to @question
    else
      render :new
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
  rescue ActiveRecord::RecordNotFound => e
    redirect_to "/404.html"
  end

  def find_question
    @question = Question.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to "/404.html"
  end

  def qustion_params
    params.require(:question).permit(:body)
  end
end
