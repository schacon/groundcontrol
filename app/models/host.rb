# == Schema Information
# Schema version: 20080728182013
#
# Table name: hosts
#
#  id           :integer(11)     not null, primary key
#  hostname     :string(255)     
#  url          :string(255)     
#  role_id      :integer(11)     
#  url_username :string(255)     
#  url_password :string(255)     
#  ssh_username :string(255)     
#  ssh_password :string(255)     
#

class Host < ActiveRecord::Base
  belongs_to :role
  has_many :exercises, :order => 'created_at DESC'
end
