class CharCounter

    def self.count string
      result = Hash.new

      string.delete(' ').each_char do |c|
        result[c] = string.count c
      end unless string.nil?

      result
    end
end