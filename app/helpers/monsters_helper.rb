module MonstersHelper
  
  # This helper method will make the CR look much nicer.
  def fraction(num)
    if num == '.125'.to_f
      num = '1/8'
    elsif num == '.17'.to_f
      num = '1/6'
    elsif num == '0.25'.to_f
      num = '1/4'
    elsif num == '.33'.to_f
      num = '1/3'
    elsif num == '0.5'.to_f
      num= '1/2'
    else
      num
    end
  end

end
