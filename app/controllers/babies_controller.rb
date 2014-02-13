class BabiesController < ApplicationController
  def new
    @baby = Baby.new
  end

  def create
    render nothing: true
  end
end
