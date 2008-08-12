# == Schema Information
# Schema version: 20080812205834
#
# Table name: pages
#
#  id          :integer(11)     not null, primary key
#  uri_pattern :string(255)     
#  role_id     :integer(11)     
#  position    :integer(11)     
#  assertions  :string(255)     
#  variables   :string(255)     
#  section     :string(255)     
#  post_data   :text            
#

class Page < ActiveRecord::Base
  belongs_to :role
  has_many :samples
  acts_as_list :scope => :role
  
  # accepts the actual uri and saves itself to the database. returns true on success
  def update_uri(p)
    update_attribute(:uri_actual, p)
  end
end
