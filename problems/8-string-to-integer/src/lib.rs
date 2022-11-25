use std::convert::TryInto;

pub struct Solution{}

impl Solution {
    pub fn my_atoi(s: String) -> i32 {
        let mut res: i32 = 0;
        let mut sign: i32 = 1;
        let mut sign_was_scanned = false;
        let mut digit_was_scanned = false;

        for c in s.chars() {
            if c >= '0' && c <= '9' {
                digit_was_scanned = true;
                let conv: i32 = c.to_digit(10).unwrap().try_into().unwrap();
                // Test overflow
                if sign > 0 && res > (i32::MAX - conv * sign) / 10 {
                    return i32::MAX;
                }
                if sign < 0 && res < (i32::MIN - conv * sign) / 10 {
                    return i32::MIN;
                }
                // Add new digit
                res = res * 10 + conv * sign;
            }
            // First '-'
            else if c == '-' && sign_was_scanned == false && digit_was_scanned == false {
                sign_was_scanned = true;
                sign *= -1;
            }
            // Repeated '-' or '-' after number
            else if c == '-' {
                return res;
            }
            // First '+'
            else if c == '+' && sign_was_scanned == false && digit_was_scanned == false {
                sign_was_scanned = true;
            }
            // Repeated '+' or '+' after number
            else if c == '+' {
                return res;
            }
            // Letters before number
            else if c != '+' && c != ' ' && digit_was_scanned == false {
                return 0;
            }
            // Space after sign
            else if c == ' ' && sign_was_scanned {
                return res;
            }
            // Letters after number
            else if digit_was_scanned == true {
                return res;
            }
        }

        return res;
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_simple_string() {
        let input = String::from("42");
        let result = Solution::my_atoi(input);
        assert_eq!(result, 42);
    }

    #[test]
    fn test_spaces() {
        let input = String::from("   -42");
        let result = Solution::my_atoi(input);
        assert_eq!(result, -42);
    }

    #[test]
    fn test_words() {
        let input = String::from("4193 with words");
        let result = Solution::my_atoi(input);
        assert_eq!(result, 4193);
    }

    #[test]
    fn test_zeros() {
        let input = String::from("0032");
        let result = Solution::my_atoi(input);
        assert_eq!(result, 32);
    }

    #[test]
    fn test_max_int() {
        let input = String::from("21474242483648");
        let result = Solution::my_atoi(input);
        assert_eq!(result, i32::MAX);
    }

    #[test]
    fn test_min_int() {
        let input = String::from("-2424147483649");
        let result = Solution::my_atoi(input);
        assert_eq!(result, i32::MIN);
    }

    #[test]
    fn test_invalid_string() {
        let input = String::from("words and 987");
        let result = Solution::my_atoi(input);
        assert_eq!(result, 0);
    }

    #[test]
    fn test_garbage_after_number() {
        let input = String::from("3.14159");
        let result = Solution::my_atoi(input);
        assert_eq!(result, 3);
    }

    #[test]
    fn test_multiple_signs() {
        let input = String::from("+-12");
        let result = Solution::my_atoi(input);
        assert_eq!(result, 0);
    }

    #[test]
    fn test_sign_after_number() {
        let input = String::from("00000-42a1234");
        let result = Solution::my_atoi(input);
        assert_eq!(result, 0);
    }

    #[test]
    fn test_minus_after_negative_number() {
        let input = String::from("-5-");
        let result = Solution::my_atoi(input);
        assert_eq!(result, -5);
    }

    #[test]
    fn test_space_after_sign() {
        let input = String::from("  +  413");
        let result = Solution::my_atoi(input);
        assert_eq!(result, 0);
    }
}
