=begin
Write a program that outputs the value of angle, reducing its fractional part to minutes and seconds.

INPUT SAMPLE:
The first argument is a path to a file that contains the values of angles with their decimal fractions:

330.39991833
0.001
14.64530319
0.25
254.16991217
_______________________________________________________________________________________________________________
OUTPUT SAMPLE:
Print to stdout values of angles with their fractional parts reduced to minutes and seconds.

The whole and fractional parts are separated by period, minutes are separated by
apostrophe, seconds by double quotes. The values of minutes and seconds are shown as two numbers
(with leading zeros if needed).

330.23'59"
0.00'03"
14.38'43"
0.15'00"
254.10'11"
=end

def nice_angles
  File.readlines(ARGV.first).map do |number|
    @time = number.to_f
    @hours = get_hours
    @minutes = get_minutes
    @seconds = get_seconds
    @minutes = @minutes.to_i
    output
    end
end

def get_hours
  @time.to_i
end

def get_minutes
  minutes = '.' + @time.to_s.split('.')[1]
  minutes.to_f * 60
end

def get_seconds
  seconds = '.' + @minutes.to_s.split('.')[1]
  (seconds.to_f * 60).to_i

end

def output
  printf("%0i.%02i\'%02i\"\n", @hours, @minutes, @seconds);
end



nice_angles