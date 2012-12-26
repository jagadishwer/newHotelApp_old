class CountersController < ApplicationController
  def new
    @counter= Counter.new
  end

  def create
    @counter= Counter.new(params[:counter])
    if @counter.save
      redirect_to :action=>'show'
    else
       redirect_to :action=>'show'
    end
  end

  def edit
    @counter=Counter.find(params[:id])
  end

  def show
    @counters=Counter.all
  end
  def update
    @counter = Counter.find(params[:counter][:id])
    @counter.update_attributes(params[:counter])
    redirect_to :action=>'show'
  end
end
