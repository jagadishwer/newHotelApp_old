# == Schema Information
#
# Table name: customers
#
#  id                  :integer          not null, primary key
#  serial_no           :integer
#  date_of_transcation :date
#  total               :float
#  table_id            :integer
#  status              :integer
#  adjusted_total      :float
#  adjustment_reason   :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Customer < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :table
  #has_many :items, :through=>:orders, :dependent=>:destroy
  has_many :orders, :dependent=>:destroy
  before_create :generate_serial_no_and_date_of_transcation
  after_initialize :init
  def init
    #self.count ||= 15
    self.status ||= 0
  end

  private
   def generate_serial_no_and_date_of_transcation
     self.serial_no = (Time.now).to_i
     self.date_of_transcation = Date.today
   end
end
