class User < ActiveRecord::Base
	has_many :borrows
	has_many :books, :through => :borrows

	attr_accessible :name, :email, :password

	def self.authenticate(name, pwd)
		User.find_by_name_and_password(name, pwd)
	end
end
