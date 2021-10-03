class User < ApplicationRecord
	before_update :admin_check_update
	before_destroy :admin_check_destroy

	has_secure_password

	validates :name, presence: true
	validates :email, presence: true, uniqueness: true

	has_many :tasks

	private

	def admin_check_update
		@user = User.where(admin: true)
		# binding.pry
		if @user.count == 1
			self.admin = true
			# throw :abort
		end
	end

	def admin_check_destroy
		@user = User.where(admin: true)
		# binding.pry
		if @user.count == 1
			# self.admin = true
			throw :abort
		end
	end

end
