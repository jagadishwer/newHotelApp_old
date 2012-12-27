class SwipeCardsController < ApplicationController
  def new
    @card=SwipeCard.new()
  end

  def refund
   
        
     @transactions=Transaction.all
    
  end
def create
  @card=SwipeCard.new(params[:swipe_card])
  if @card.save
    @counter=Counter.find_by_name('main_counter')
    Transaction.create(:counter_id=>@counter,:cost=>params[:swipe_card][:balance].to_f,:swipe_card_id=>@card.id,:type_of_transaction=>1,:balance=>@card.balance)
    redirect_to :action=>'main_counter', :controller=>'counters'
  else
    redirect_to :action=>'new'
  end

end
  def show

  end
  def recharge
    if request.post?
        @card=SwipeCard.find_by_card_no(params[:swipe_card][:card_no])
        @amount=@card.balance+params[:swipe_card][:balance].to_f
        @counter=Counter.find_by_name('main_counter')
        #render :text=>@amount
       if  @card.update_attributes(:balance=>@amount)
         Transaction.create(:counter_id=>@counter,:cost=>params[:swipe_card][:balance].to_f,:swipe_card_id=>@card.id,:type_of_transaction=>1,:balance=>@card.balance)
        redirect_to :action=>'main_counter', :controller=>'counters'
       
      end
      else
        @card=SwipeCard.new()
    end
  end


  
  def update

  
@t=Transaction.find(params[:id])
@c=SwipeCard.find(@t.swipe_card_id)
@c.balance=@c.balance.to_f+@t.cost.to_f
@counter=Counter.find_by_name('main_counter')
if @c.save
  Transaction.create(:counter_id=>@counter,:cost=>@t.cost,:swipe_card_id=>@c.id,:type_of_transaction=>1,:balance=>@c.balance)
   redirect_to :action=>'main_counter', :controller=>"counters"
end
  end
end
