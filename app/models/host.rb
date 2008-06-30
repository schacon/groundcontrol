class Host < ActiveRecord::Base
  belongs_to :role
  has_many :exercises, :order => 'created_at DESC'
end
