class BabiesController < ApplicationController
  def new
    @baby = Baby.new
  end

  def create
    render nothing: true
  end

  def edit
    @baby = Baby.find(params[:id])
  end

  def update
    render nothing: true
  end
end
