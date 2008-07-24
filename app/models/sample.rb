# == Schema Information
# Schema version: 20080724205241
#
# Table name: samples
#
#  id             :integer(11)     not null, primary key
#  exercise_id    :integer(11)     
#  page_id        :integer(11)     
#  passed         :boolean(1)      
#  user           :integer(11)     
#  response       :integer(11)     
#  time           :float           
#  created_at     :datetime        
#  updated_at     :datetime        
#  page_data      :string(255)     
#  page_size      :integer(11)     
#  changed_memory :float           
#  page_uri       :string(255)     
#  total_memory   :float           
#

class Sample < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :page
  
  named_scope :rev, :order => 'created_at DESC'
  
end
