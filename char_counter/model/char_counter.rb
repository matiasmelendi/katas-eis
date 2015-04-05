class CharCounter

    def self.count string
      result = Hash.new

      string.each_char do |c|
        result[c] = string.count c
      end

      result
    end
end