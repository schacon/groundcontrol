class Exercise < ActiveRecord::Base
  belongs_to :host
  has_many :samples
  
  named_scope :recent, :order => 'created_at DESC', :limit => 10
  
end