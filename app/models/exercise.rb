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