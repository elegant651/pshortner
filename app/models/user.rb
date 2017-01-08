class User < ActiveRecord::Base
	has_many :userlinks
	has_many :links, :through => :userlinks
end
