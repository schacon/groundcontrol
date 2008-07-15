# == Schema Information
# Schema version: 20080708165855
#
# Table name: roles
#
#  id   :integer(11)     not null, primary key
#  role :string(255)     
#

class Role < ActiveRecord::Base
  has_many :hosts
  has_many :pages, :order => "position"
end
