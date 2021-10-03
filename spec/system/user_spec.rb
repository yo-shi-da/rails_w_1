require "rails_helper"

describe 'ユーザー機能', type: :system do

	# # OK
	# describe '管理画面テスト' do
	# 	context '管理ユーザは管理画面にアクセスしたとき' do			
	# 		it 'ユーザの削除をできること' do
	# 			FactoryBot.create(:user, name: "ユーザーA", email: "a@example.com", password: "password", password_confirmation: "password", admin: "true")
	# 			FactoryBot.create(:user, name: "ユーザーB", email: "b@example.com", password: "password", password_confirmation: "password", admin: "true")
	# 			visit login_path
	# 			fill_in :session_email, with: 'a@example.com'
	# 			fill_in :session_password, with: 'password'
	# 			click_button 'ログインする'
	# 			click_on '管理'
	# 			(all('tbody tr')[0]).click_link '削除'
	# 			page.driver.browser.switch_to.alert.accept
	# 			expect(page).to have_content '「ユーザーA」を削除しました。'
	# 		end
	# 	end
	# end

	# # OK
	# describe '管理画面テスト' do
	# 	context '管理ユーザは編集画面にアクセスしたとき' do			
	# 		it 'ユーザを編集できること' do
	# 			FactoryBot.create(:user, name: "ユーザーA", email: "a@example.com", password: "password", password_confirmation: "password", admin: "true")
	# 			visit login_path
	# 			fill_in :session_email, with: 'a@example.com'
	# 			fill_in :session_password, with: 'password'
	# 			click_button 'ログインする'
	# 			click_on '管理'
	# 			click_on '編集'
	# 			fill_in :user_name, with: 'ユーザーB'
	# 			click_button '更新する'
	# 			expect(page).to have_content 'ユーザーB'
	# 		end
	# 	end
	# end

	# # OK
	# describe '管理画面テスト' do
	# 	context '管理ユーザは管理画面にアクセスしたとき' do			
	# 		it 'ユーザの詳細画面にアクセスできること' do
	# 			FactoryBot.create(:user, name: "ユーザーA", email: "a@example.com", password: "password", password_confirmation: "password", admin: "true")
	# 			visit login_path
	# 			fill_in :session_email, with: 'a@example.com'
	# 			fill_in :session_password, with: 'password'
	# 			click_button 'ログインする'
	# 			click_on '管理'
	# 			click_on '詳細'
	# 			expect(page).to have_content 'ユーザー詳細'
	# 		end
	# 	end
	# end

	# # OK
	# describe '管理画面テスト' do
	# 	context '管理ユーザは管理画面にアクセスしたとき' do			
	# 		it 'ユーザの新規登録ができること' do
	# 			FactoryBot.create(:user, name: "ユーザーA", email: "a@example.com", password: "password", password_confirmation: "password", admin: "true")
	# 			visit login_path
	# 			fill_in :session_email, with: 'a@example.com'
	# 			fill_in :session_password, with: 'password'
	# 			click_button 'ログインする'
	# 			click_on '管理'
	# 			click_on '新規作成'
	# 			fill_in :user_name, with: 'ユーザーB'
	# 			fill_in :user_email, with: 'b@example.com'
	# 			uncheck 'user_admin'
	# 			fill_in :user_password, with: 'password'
	# 			fill_in :user_password_confirmation, with: 'password'
	# 			click_button '登録する'
	# 			expect(page).to have_content '「ユーザーB」を登録しました。'
	# 		end
	# 	end
	# end

	# # OK
	# describe '管理画面テスト' do
	# 	context '一般ユーザは管理画面にアクセスしたとき' do			
	# 		it 'アクセスできないこと' do
	# 			FactoryBot.create(:user, name: "ユーザーA", email: "a@example.com", password: "password", password_confirmation: "password", admin: "false")
	# 			# binding.pry
	# 			visit login_path
	# 			fill_in :session_email, with: 'a@example.com'
	# 			fill_in :session_password, with: 'password'
	# 			click_button 'ログインする'
	# 			click_on '管理'
	# 			page.driver.browser.switch_to.alert.accept
	# 			expect(page).to have_content '「ユーザーA」のタスク一覧'
	# 			# binding.pry
	# 		end
	# 	end
	# end

	# # OK
	# describe '管理画面テスト' do
	# 	context '管理ユーザは管理画面にアクセスしたとき' do			
	# 		it 'アクセスできること' do
	# 			FactoryBot.create(:user, name: "ユーザーA", email: "a@example.com", password: "password", password_confirmation: "password", admin: "true")
	# 			# binding.pry
	# 			visit login_path
	# 			fill_in :session_email, with: 'a@example.com'
	# 			fill_in :session_password, with: 'password'
	# 			click_button 'ログインする'
	# 			click_on '管理'
	# 			expect(page).to have_content 'ユーザー一覧'
	# 			# binding.pry
	# 		end
	# 	end
	# end

	# # OK
	# describe 'セッション機能テスト' do
	# 	context 'ログアウトしたとき' do			
	# 		it 'ログアウトという言葉がある' do
	# 			FactoryBot.create(:user, name: "ユーザーA", email: "a@example.com", password: "password", password_confirmation: "password")
	# 			visit login_path
	# 			fill_in :session_email, with: 'a@example.com'
	# 			fill_in :session_password, with: 'password'
	# 			click_button 'ログインする'
	# 			click_on 'ログアウト'
	# 			page.driver.browser.switch_to.alert.accept
	# 			expect(page).to have_content 'ログアウトしました。'
	# 			# binding.pry
	# 		end
	# 	end
	# end

	# # OK
	# describe 'セッション機能テスト' do
	# 	context '一般ユーザが他人の詳細画面に飛ぶとき' do			
	# 		it 'タスク一覧画面に遷移すること' do
	# 			FactoryBot.create(:user, name: "ユーザーA", email: "a@example.com", password: "password", password_confirmation: "password")
	# 			visit login_path
	# 			fill_in :session_email, with: 'a@example.com'
	# 			fill_in :session_password, with: 'password'
	# 			click_button 'ログインする'
	# 			click_on '管理'
	# 			page.driver.browser.switch_to.alert.accept
	# 			expect(page).to have_selector 'h1', text: '「ユーザーA」のタスク一覧'
	# 			# binding.pry
	# 		end
	# 	end
	# end

	# # OK
	# describe 'セッション機能テスト' do
	# 	context 'ログインしたとき' do			
	# 		it '自分の詳細画面（マイページ）が表示される' do
	# 			FactoryBot.create(:user, name: "ユーザーA", email: "a@example.com", password: "password", password_confirmation: "password")
	# 			visit login_path
	# 			fill_in :session_email, with: 'a@example.com'
	# 			fill_in :session_password, with: 'password'
	# 			click_button 'ログインする'
	# 			click_on 'Mypage'
	# 			expect(page).to have_selector 'h1', text: '「ユーザーA」のMypage'
	# 			# binding.pry
	# 		end
	# 	end
	# end

	# # OK
	# describe 'セッション機能テスト' do
	# 	context 'ログインしたとき' do			
	# 		it '正常にログインできる' do
	# 			FactoryBot.create(:user, name: "ユーザーA", email: "a@example.com", password: "password", password_confirmation: "password")
	# 			visit login_path
	# 			fill_in :session_email, with: 'a@example.com'
	# 			fill_in :session_password, with: 'password'
	# 			click_button 'ログインする'
	# 			expect(page).to have_selector 'h1', text: '「ユーザーA」のタスク一覧'
	# 			# binding.pry
	# 		end
	# 	end
	# end
	
	# # OK
	# describe 'ユーザー登録' do
	# 	context 'ユーザがログインせずタスク一覧画面に飛ぼうとしたとき' do			
	# 		it 'ログイン画面に遷移すること' do
	# 			visit login_path
	# 			click_on 'task一覧'
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
	# 			visit tasks_path
	# 			expect(page).to have_selector 'h1', text: '「ユーザーA」のタスク一覧'
	# 		end
	# 	end
	# end

	
end