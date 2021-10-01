require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do

  # # OK
  describe '新規作成機能' do
    context 'タスクを新規作成し、一覧画面に移動した場合' do
      it 'リンク押すと終了期限の降順に並び替えられる' do
        visit new_task_path
        fill_in 'task_name', with: 'タスクです。'
        fill_in 'task_description', with: 'タスク詳細です。'
        fill_in 'task_expired_at', with: '002020-01-02'
        click_button '登録する'
        visit tasks_path
        sleep 1.0
        click_link 'sort_expired'
        sleep 1.0
        expect(all('tbody tr')[0]).to have_content '2020年01月02日'
      end
    end
  end

  # OK
  describe '優先順位' do
    context 'タスクを新規作成し,一覧画面に移動した場合' do
      it 'リンク押すと優先順位に順に並び替えられる' do
        visit new_task_path
        fill_in :task_name, with: 'タスクです。'
        fill_in :task_description, with: 'タスク詳細です。'
        fill_in :task_expired_at, with: '002020-01-02'
        select :高, from: 'task_priority'
        click_button '登録する'
        # sleep 1.0
        visit tasks_path
        click_link 'sort_priority'
        # sleep 1.0
        expect(all('tbody tr')[0]).to have_content '高'
      end
    end
  end

  describe '検索機能' do
    before do
      # 必要に応じて、テストデータの内容を変更して構わない
      FactoryBot.create(:task, name: "task", status: "完了")
      FactoryBot.create(:task, name: "sample", status: "着手中")
      FactoryBot.create(:task, name: "sample2", status: "未着手")
    end

    # NG そもそもタスクがない。よって、「before」等でタスクを作成する。また、テストなので3つ以上必要。
    context 'タイトルであいまい検索をした場合' do
      it "検索キーワードを含むタスクで絞り込まれる" do
        visit tasks_path
        # タスクの検索欄に検索ワードを入力する (例: task)
        fill_in :task_search, with: 'task'
        # 確認したところ、「Task.all」にデータは保存されている。
        # binding.pry
        # fill_in 'task[search]', with: 'task'
        # 検索ボタンを押す
        click_button '検索'
        # expect(page).to have_content 'task'
      end
    end

    # # OK
    context 'ステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        # ここに実装する
        visit tasks_path
        # プルダウンを選択する「select」について調べてみること
        select '完了', from: 'task_status'
        click_on '検索'
        expect(page).to have_content '完了'
      end
    end

    # # OK
    context 'タイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        # ここに実装する
        visit tasks_path
        # タスクの検索欄に検索ワードを入力する (例: task)
        fill_in 'task_search', with: 'task'
        select '完了', from: 'task_status'
        click_on '検索'
        expect(page).to have_content '完了' and have_content 'task'
      end
    end
    # 
  end

  describe '一覧表示機能' do

    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        task = FactoryBot.create(:task, name: 'task')
        visit tasks_path
        expect(page).to have_content 'task'
      end
    end
  
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        task = FactoryBot.create(:task, name: '名称')
        visit tasks_path
        expect(all('tbody tr')[0]).to have_content '名称'
      end
    end
  
  end

  describe '詳細表示機能' do

     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
        task_a = FactoryBot.create(:task, name: '名称')
        visit task_path(task_a)
        expect(page).to have_content '名称'
       end
     end
  
  end
end