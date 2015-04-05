class CharCounter

    def self.count string
      result = Hash.new

      count_chars(result, string) unless string.nil?

      result
    end

  private

  def self.without_withe_spaces string
    string.delete(' ')
  end

  def self.count_chars hash, string
    without_withe_spaces(string).each_char do |c|
      hash[c] = string.count c
    end
  end
end