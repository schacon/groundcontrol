# == Schema Information
# Schema version: 20080627214910
#
# Table name: pages
#
#  id         :integer(11)     not null, primary key
#  path       :string(255)     
#  role_id    :integer(11)     
#  order      :integer(11)     
#  assertions :string(255)     
#  variables  :string(255)     
#  section    :string(255)     
#

class Page < ActiveRecord::Base
  belongs_to :role
  has_many :samples
end
