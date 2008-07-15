require File.join(File.dirname(__FILE__), '..', 'test', 'test_helper')

class RmcRunnerTest < Test::Unit::TestCase
  fixtures :exercises
  
  def test_pound
    sample_count = Sample.count
    exercise     = exercises(:ex_1_for_google)
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
    assert_equal sample_count+num_hits_per, Sample.count
  end
end
