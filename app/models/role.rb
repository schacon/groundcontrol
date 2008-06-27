class Role < ActiveRecord::Base
  has_many :hosts
  has_many :pages
end
