# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit update destroy]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params.merge(author_id: author.id))

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  private

  def author
    @author ||= User.first
  end

  def find_test
    @test = Test.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to "/404.html"
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
