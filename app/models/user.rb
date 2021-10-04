class User < ApplicationRecord
	before_update :admin_check_update
	before_destroy :admin_check_destroy

	has_secure_password

	validates :name, presence: true
	validates :email, presence: true, uniqueness: true

	has_many :tasks, dependent: :destroy
	# has_many :tasks, dependent: :delete_all

	private

	# このコードで良い。管理者しかユーザー変更はできない。よって、管理者以外（admin=false）は編集ができない。
	# ということは、一般ユーザー（admin=false）は、ユーザー編集できず、編集可能は管理者（admin=true）ユーザーのみ。
  def admin_check_update
		@user = User.where(admin: true)
		if @user.count == 1 && self.admin == false
			throw :abort
		end
	end

	def admin_check_destroy
		@user = User.where(admin: true)
		if @user.count <= 1 && self.admin == true
			throw :abort			
		end
	end
	
end

# if @user.count == 1 && self.admin == true
# throw :abort
# self.admin = false
# binding.pry