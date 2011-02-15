class LeaguesController < ApplicationController
  layout 'dashboard'
  before_filter :authenticate_user!  
  
  def index
    @leagues= current_user.leagues
  end
  
  def show
    @league = League.find(params[:id])
  end
  
  def new
    @league = League.new
  end
  
  def create
    @league = current_user.leagues.create(params[:league])
    @league.manager = current_user
    if @league.save
      flash[:notice] = "League has been successfully created!"
      redirect_to root_path
    else
      render :action => 'new'
    end
  end
end
