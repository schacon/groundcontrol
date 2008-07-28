module HostsHelper
  def display_short_exercise_type(ex)
    case ex.exercise_type
    when Exercise::EXERCISE_TYPES[0]
      'P'
    when Exercise::EXERCISE_TYPES[1]
      'M'
    else
      '?'
    end
  end
end
