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
    @counters=Counter.find(:all, :conditions=>"name!='main_counter'")
  end
  def update
    @counter = Counter.find(params[:counter][:id])
    @counter.update_attributes(params[:counter])
    redirect_to :action=>'show'
  end
  def main_counter
<<<<<<< HEAD
  end
  def other_counter
  end
=======

  end
  def other_counter
    
  end
  def counter_items
    @counter = Counter.find_by_id(params[:counter][:counter_id])
    @items = @counter.items
  end
  
>>>>>>> fbad6937242025178b12c0020af19370c636142d
end
