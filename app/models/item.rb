# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  item_name   :string(255)
#  price       :float
#  description :text
#  category_id :integer
#

class Item < ActiveRecord::Base
  attr_accessible :item_name, :price, :category_id,:counter_id, :description, :attachments_attributes

  #has_many :customers, :through=>:orders, :dependent=>:destroy
  has_many :orders, :through=>:orderlists
  belongs_to :category
  has_many :orderlists
  has_many :attachments, :as => :attachable, :dependent => :destroy
  accepts_nested_attributes_for :attachments, :allow_destroy => true
  belongs_to :counters
end
