class GoldenwordsController < ApplicationController
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

  def test
    @goldenwords = Goldenword.all
  end

  private

    def goldenword_params
      params.require( :goldenword ).permit( :correct, :wrong )
    end
  
end
