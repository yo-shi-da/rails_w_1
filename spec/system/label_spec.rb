require "rails_helper"

describe 'ラベル機能', type: :system do
	
    # 共通化
  before do
    user_a = FactoryBot.create(:user, name: "ユーザーA", email: "a@example.com")
    FactoryBot.create(:task, name: "最初のタスク", user: user_a)

    visit login_path
    fill_in :session_email, with: 'a@example.com'
    fill_in :session_password, with: 'password'
    click_button "ログインする"
    FactoryBot.create(:label, name: 'test')
    FactoryBot.create(:label, name: 'test2')
    FactoryBot.create(:label, name: 'test3')
  end
      
  # OK
  describe 'ラベルの紐付け' do
    context 'タスクの詳細画面にアクセスしたとき' do			
      it 'タスクに紐づいているラベル一覧(複数)を確認できること' do
        visit new_task_path
        fill_in :task_name, with: 'タスクです。'
        fill_in :task_description, with: 'タスク詳細です。'
        fill_in :task_expired_at, with: '002021-01-02'
        select :高, from: 'task_priority'
        # binding.pry
        check 'test'
        check 'test2'
        click_button '登録する'
        expect(page).to have_content 'test' and have_content 'test2'
      end
    end
  end
  
    # OK
    describe 'ラベル新規作成' do
		context 'ラベルを作成したとき' do			
			it '正常にラベルが登録できていること' do
        visit new_task_path
        fill_in :task_name, with: 'タスクです。'
        fill_in :task_description, with: 'タスク詳細です。'
        fill_in :task_expired_at, with: '002021-01-02'
        select :高, from: 'task_priority'
        # binding.pry
        check 'test'
        click_button '登録する'
        expect(page).to have_content 'タスク「タスクです。を登録しました。」'
			end
		end
	end  
  
  # OK
  describe 'ラベルの検索' do
    context 'ラベルを検索したとき' do			
      it '検索したラベル一覧が表示されること' do
        visit new_task_path
        fill_in :task_name, with: 'タスクです。'
        fill_in :task_description, with: 'タスク詳細です。'
        fill_in :task_expired_at, with: '002021-01-02'
        select :高, from: 'task_priority'
        # binding.pry
        check 'test'
        check 'test2'
        click_button '登録する'
        visit tasks_path
  
        select 'test', from: 'task_label_id'
        click_on '検索'
        expect(page).to have_content 'test'
      end
    end
  end
  
end
