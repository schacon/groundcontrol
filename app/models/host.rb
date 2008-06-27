class Host < ActiveRecord::Base
  belongs_to :role
  has_many :excercises
end
