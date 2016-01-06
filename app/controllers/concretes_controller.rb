class ConcretesController < ApplicationController
  def new
    @concrete = Concrete.new
  end

  def create
    render nothing: true
  end

  def edit
    @concrete = Concrete.find(params[:id])
  end

  def show
  end

  def update
    render nothing: true
  end
end
