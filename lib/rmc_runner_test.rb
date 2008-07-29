require File.join(File.dirname(__FILE__), '..', 'test', 'test_helper')

class RmcRunnerTest < Test::Unit::TestCase
  fixtures :exercises, :samples
  
  def test_pound
    pre_existing_sample_count = Sample.count
    exercise     = exercises(:localhost)
    host         = exercise.host
    opts         = {
      :login     => '/login/login',
      :fields    => {:login => 'login', :password => 'password'},
      :host      => host,
      :exercise  => exercise,
      :logger    => RAILS_DEFAULT_LOGGER
    }
    num_hits_per = 10
    num_users    = 1
    runner       = RmcRunner.new(opts)
    # currently, the call to pound will result in "Argh - Login Failed" printed out STDOUT.
    runner.pound(num_hits_per, num_users)
    expected_samples = pre_existing_sample_count + ((num_hits_per*num_users) *host.role.pages.size)
    assert_equal expected_samples, Sample.count
  end
end
