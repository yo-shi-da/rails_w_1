require "rails_helper"

describe 'ユーザー機能', type: :system do
	
	# # OK
	# describe 'ユーザー登録' do
	# 	context 'ユーザがログインせずタスク一覧画面に飛ぼうとしたとき' do			
	# 		it 'ログイン画面に遷移すること' do
	# 			visit login_path
	# 			click_on 'task一覧'
	# 			# binding.pry
	# 			expect(page).to have_selector 'h1', text: 'ログイン'
	# 		end
	# 	end
	# end

	# # OK
	# describe 'ユーザー登録' do
	# 	context 'ユーザを新規登録した時' do			
	# 		it '正常に登録される' do
	# 			visit new_user_path
	# 			fill_in :user_name, with: 'ユーザーA'
	# 			fill_in :user_email, with: 'a@example.com'
	# 			fill_in :user_password, with: 'password'
	# 			fill_in :user_password_confirmation, with: 'password'
	# 			click_button '登録する'
	# 			# binding.pry
	# 			visit tasks_path
	# 			expect(page).to have_selector 'h1', text: '「ユーザーA」のタスク一覧'
	# 			# FactoryBot.create(:user, name: "ユーザーA", email: "a@example.com", password: "a@example.com, password_confirmation: "password")
	# 		end
	# 	end
	# end

	
end