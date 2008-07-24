# == Schema Information
# Schema version: 20080724205241
#
# Table name: exercises
#
#  id         :integer(11)     not null, primary key
#  host_id    :integer(11)     
#  passed     :integer(11)     
#  failed     :integer(11)     
#  users      :integer(11)     
#  created_at :datetime        
#  updated_at :datetime        
#

class Exercise < ActiveRecord::Base
  belongs_to :host
  has_many :samples
  
  named_scope :recent, :order => 'created_at DESC', :limit => 10
  
  def sample_size
    samples.size
  end
  
  def pass_fraction
    passes = samples.select { |s| s.passed }.size
    size = sample_size
    "#{passes}/#{size}"
  end
  
  def pass_percent
    passes = samples.select { |s| s.passed }.size
    size = sample_size
    ((passes.to_f / size.to_f) * 100.0).round if size > 0
  end
  
  def avg_time
    if sample_size > 0
      total = samples.inject(1) {|total, n| total += n.time if n.time }
      return total / sample_size if total
    end
  end
  
end
