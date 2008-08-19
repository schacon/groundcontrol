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
end
