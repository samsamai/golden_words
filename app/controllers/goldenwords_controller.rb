class GoldenwordsController < ApplicationController
  before_action :set_goldenword, only: [:show]
  def index
    @goldenwords = Goldenword.all
  end

  def update
    @goldenword = Goldenword.find(params[:id])
    if @goldenword.update( goldenword_params )
      render json: @goldenword
    else
      render json: @goldenword.errors, status: :unprocessable_entity
    end
  end

  def new
    @goldenword = Goldenword.new
  end

  def create
    @goldenword = Goldenword.new( goldenword_params )

    if @goldenword.save
      render json: @goldenword
    else
      render json: @goldenword.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @goldenword = Goldenword.find(params[:id])
    @goldenword.destroy
    head :no_content
  end

  def show
  end

  def edit
    p "@" * 100
    p params
  end

  def test
    @goldenwords = Goldenword.all
  end

  private
    def set_goldenword
      @goldenword = Goldenword.find( params[:id] )
    end

    def goldenword_params
      params.require( :goldenword ).permit( :text, :bg_colour, :correct, :wrong )
    end
  
end
