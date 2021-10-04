class User < ApplicationRecord
	before_update :admin_check_update
	before_destroy :admin_check_destroy

	has_secure_password

	validates :name, presence: true
	validates :email, presence: true, uniqueness: true

	has_many :tasks, dependent: :destroy
	# has_many :tasks, dependent: :delete_all

	private

	def admin_check_update
		@user = User.where(admin: true)
		if @user.count == 1
			self.admin = true
		end
	end
	# if @user.count == 1 && self.admin == true
	# throw :abort
	# self.admin = false

	def admin_check_destroy
		@user = User.where(admin: true)
		if @user.count == 1 && self.admin == true
			throw :abort			
		end
	end
	# binding.pry

end