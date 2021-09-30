require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it 'リンクを押すと終了期限の降順に並び替えられる' do
        visit new_task_path
        fill_in 'task_name', with: 'タスクです。'
        fill_in 'task_description', with: 'タスク詳細です。'
        fill_in 'task_expired_at', with: '002020-01-02'
        click_button '登録する'
        visit tasks_path
        click_link 'sort_expired'
        expect(all('tbody tr')[0]).to have_content '2020年01月02日'
      end
    end
  end

  # describe '一覧表示機能' do
  #   context '一覧画面に遷移した場合' do
  #     it '作成済みのタスク一覧が表示される' do
  #       task = FactoryBot.create(:task, name: 'task')
  #       visit tasks_path
  #       expect(page).to have_content 'task'
  #     end
  #   end
    
  #   context 'タスクが作成日時の降順に並んでいる場合' do
  #     it '新しいタスクが一番上に表示される' do
  #       task = FactoryBot.create(:task, name: '名称')
  #       visit tasks_path
  #       expect(all('tbody tr')[0]).to have_content '名称'
  #     end
  #   end
  # end

  # describe '詳細表示機能' do
  #    context '任意のタスク詳細画面に遷移した場合' do
  #      it '該当タスクの内容が表示される' do
  #       task_a = FactoryBot.create(:task, name: '名称')
  #       visit task_path(task_a)
  #       expect(page).to have_content '名称'
  #      end
  #    end
  # end
end