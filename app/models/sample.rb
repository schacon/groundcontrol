class Sample < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :page
  
  named_scope :rev, :order => 'created_at DESC'
  
end