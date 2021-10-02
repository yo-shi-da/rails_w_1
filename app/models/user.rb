class User < ApplicationRecord
	before_update :set_admin_check
	before_destroy :set_admin_check

	has_secure_password

	validates :name, presence: true
	validates :email, presence: true, uniqueness: true

	has_many :tasks

	private

	# def :set_admin_check
	# 	@admin = User.all
	# 	if 
	# 	else
	# 	end
	# end
end
