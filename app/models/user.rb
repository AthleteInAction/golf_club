class User < ActiveRecord::Base

	has_secure_password
	
	validates_presence_of :name,:email
	validates_format_of :email, with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
	validates_uniqueness_of :email

end