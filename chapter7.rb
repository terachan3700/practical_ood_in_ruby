require '../samplecode/chapter07_module'

class Schedule
  def scheduled?(schedulable, start_date, end_date)
    puts "This #{schedulable.class}" +
           "is not scheduled¥n" +
           " between #{start_date} and #{end_date}"
    false
  end
end

class Bicycle

  include Schedulable

  def lead_days
    1
  end
end

require 'date'
starting = Date.parse("2015/09/04")
ending = Date.parse("2015/09/10")

b = Bicycle.new
puts b.schedulable?(starting,ending)