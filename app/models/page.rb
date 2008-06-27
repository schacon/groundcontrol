class Page < ActiveRecord::Base
  belongs_to :role
  has_many :samples
end
