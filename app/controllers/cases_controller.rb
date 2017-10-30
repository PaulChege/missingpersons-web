class CasesController < ApplicationController
  def index
    @cases = Case.all
  end

  def show
    @c = Case.find(params[:id])
    @matches = @c.matches
  end

end
