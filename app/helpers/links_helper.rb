module LinksHelper
	
	def encoded_url_fromid(id)
		url = 'http://localhost:3000/' + Base58.encode(id)
	end	
end
