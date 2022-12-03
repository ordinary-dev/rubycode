def my_atoi(s)
  res = 0
  sign = 1
  sign_was_scanned = false
  digit_was_scanned = false

  i32_min = -2_147_483_648
  i32_max = 2_147_483_647

  s.each_char do |c|
    if c >= '0' && c <= '9'
      digit_was_scanned = true
      conv = c.ord - '0'.ord
      
      # Add new digit
      res = res * 10 + conv * sign
      
      # Test overflow
      return i32_max if sign > 0 && res > i32_max
      return i32_min if sign < 0 && res < i32_min
      
    
    # First '-'
    elsif c == '-' && sign_was_scanned == false && digit_was_scanned == false
      sign_was_scanned = true
      sign *= -1

    # First '+'
    elsif c == '+' && sign_was_scanned == false && digit_was_scanned == false
      sign_was_scanned = true
    
    # Repeated '-' or '-' after number
    elsif c == '-'
      return res
    
    # Repeated '+' or '+' after number
    elsif c == '+'
      return res
    
    # Letters before number
    elsif c != '+' && c != ' ' && digit_was_scanned == false
      return 0
    
    # Space after sign
    elsif c == ' ' && sign_was_scanned
      return res
    
    # Letters after number
    elsif digit_was_scanned == true
      return res
    end
  end

  res
end
