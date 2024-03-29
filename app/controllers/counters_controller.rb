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

  end
  def other_counter
    session[:counter]=nil
  end

  
  def counter_items
    if session[:counter].nil?
    @counter = Counter.find_by_id(params[:counter][:counter_id])
    session[:counter]=params[:counter][:counter_id]
    else
      @counter=Counter.find_by_id(session[:counter])
    end
    @items = @counter.items
   @order_lists=Orderlist.find(:all,:conditions=>{:counter_id=>session[:counter],:order_id=>nil})

  end
  def confirm_order
    
  end
  def cancel_order
    @order_lists=Orderlist.find(:all,:conditions=>{:counter_id=>session[:counter],:order_id=>nil})
    @order_lists.each do |i|
      i.destroy
    end
    redirect_to :controller => "counters", :action => "counter_items"
  end
  

end
