
class Base58

	ALPHABET = "123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ"
	BASE = ALPHABET.length


	def self.encode(val)
		unless val.is_a? (Integer)
			raise ArgumentError, 'value should be Integer'
		end
		encoded_val = ''
		while(val >= BASE)
			mod = val % BASE
			encoded_val = ALPHABET[mod,1] + encoded_val
			val = (val-mod)/BASE
		end
		ALPHABET[val,1] + encoded_val
	end

	def self.decode(str)
		val = 0
		str.reverse.split(//).each_with_index do |char,index|			
			char_idx = ALPHABET.index(char)
			if char_idx.nil
				raise ArgumentError, 'value should be base58 string'
			end
			val += (char_idx)*(BASE**(index))
		end
		val
	end

end