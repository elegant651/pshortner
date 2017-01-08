class Link < ActiveRecord::Base
	has_many :userlinks
	has_many :users, :through => :userlinks
end
