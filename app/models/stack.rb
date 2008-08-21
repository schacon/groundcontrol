# == Schema Information
# Schema version: 20080819160004
#
# Table name: stacks
#
#  id         :integer(11)     not null, primary key
#  name       :string(50)      
#  created_at :datetime        
#  updated_at :datetime        
#

class Stack < ActiveRecord::Base
  has_and_belongs_to_many :hosts
  validates_presence_of :name
end
