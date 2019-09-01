module Luhn
  def self.is_valid?(number)
    new_number = number.to_s.scan(/\d/).reverse.map(&:to_i).map.with_index do |value, index|
      if index.odd?
        dbl_value = value * 2
        if dbl_value >= 10
          dbl_value - 9
        else
          dbl_value
        end
      else
        value
      end
    end
    sum = 0
    return false unless (new_number.each { |n| sum += n }.reduce(:+) % 10).zero?
    true
  end
end

Luhn.is_valid?(4194560385008504)
