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

    respond_to do |format|
      if @goldenword.save
        format.html { redirect_to @goldenword, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @goldenword }
      else
        format.html { render :new }
        format.json { render json: @goldenword.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def test
    @goldenwords = Goldenword.all
  end

  private
    def set_goldenword
      @goldenword = Goldenword.find( params[:id] )
    end

    def goldenword_params
      params.require( :goldenword ).permit( :text, :correct, :wrong )
    end
  
end
