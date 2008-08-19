# == Schema Information
# Schema version: 20080819160004
#
# Table name: exercises
#
#  id                         :integer(11)     not null, primary key
#  host_id                    :integer(11)     
#  passed                     :integer(11)     
#  failed                     :integer(11)     
#  users                      :integer(11)     
#  created_at                 :datetime        
#  updated_at                 :datetime        
#  exercise_type              :string(30)      
#  aut_version                :string(50)      
#  aut_note                   :text            
#  num_concurrent_connections :integer(11)     
#  num_hits_per_page          :integer(11)     
#

class Exercise < ActiveRecord::Base
  EXERCISE_TYPES = %w{performance memory}.freeze
  
  DEFAULT_NUM_CONCURRENT_CONNECTIONS = 1
  DEFAULT_NUM_HITS_PER_PAGE          = 10
  
  belongs_to :host
  has_many :samples
  
  named_scope :recent, :order => 'created_at DESC', :limit => 10
  
  
  validates_inclusion_of :exercise_type, :in => EXERCISE_TYPES
  
  
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
  
  def num_concurrent_connections
    x = read_attribute(:num_concurrent_connections)
    return DEFAULT_NUM_CONCURRENT_CONNECTIONS if x.blank?
    x
  end
  
  def num_hits_per_page
    x = read_attribute(:num_hits_per_page)
    return DEFAULT_NUM_HITS_PER_PAGE if x.blank?
    x
  end
  
  def expected_samples
    num_concurrent_connections*num_hits_per_page*host.role.pages.size
  end
end
