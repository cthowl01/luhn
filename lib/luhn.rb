module Luhn
  def self.is_valid?(number)
    
    # Create an array out of the number
    array = number.to_s.split('').map(&:to_i)

    # Check that the number is either 15 or 16 digits before continuing,
    # and set the toggle value to be used in later calculations
    if array.length == 16
        toggle = 0
    elsif array.length == 15
        toggle = 1
    else
      print "#{array.length} is an Invalid length, exiting"
      return false
    end

    # Starting from the right, double every second digit then subtract nine
    array.each_with_index do |element, index|
 
      if (index % 2 == toggle)
        if element * 2 >= 10
          array[index] = ((element * 2)-9)
        else
          array[index] = (element * 2)
        end
      end
    end

    # Sum the digits
    sum = 0

    array.each do |e|
      sum += e
    end

    # If the digits' sum is divisible by 10, it is a valid number
    if sum % 10 == 0
      return true
    # If not, it is invalid
    else
      return false
    end

  end
end