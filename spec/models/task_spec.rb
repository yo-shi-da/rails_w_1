require 'rails_helper'

RSpec.describe 'タスクモデル機能', type: :model do

  describe 'バリデーションのテスト' do
    
    context 'タスクのタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        task = Task.new(name: '', description: '詳細1')
        expect(task).not_to be_valid
      end
    end
    
    context 'タスクの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        task = Task.new(name: '名称2', description: '')
        expect(task).to be_valid
      end
    end
    
    context 'タスクのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        task = Task.new(name: '名称3', description: '詳細3')
        expect(task).to be_valid
      end
    end

  end

  describe '検索機能' do

    # 必要に応じて、テストデータの内容を変更して構わない
    let!(:task) { FactoryBot.create(:task, name: 'task1', status: '完了') }
    let!(:second_task) { FactoryBot.create(:task, name: 'sample1', status: '未着手') }

    # # OK
    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it "検索キーワードを含むタスクが絞り込まれる" do
        # title_seachはscopeで提示したタイトル検索用メソッドである。メソッド名は任意で構わない。
        expect(Task.search_sort('task1')).to include(task)
        expect(Task.status_sort('完了')).not_to include(second_task)
        expect(Task.status_sort('完了').count).to eq 1
      end
    end

    # # OK 探すのは”文字列”でなく、”その文字列が含まれるレコード”を探している。
    context 'scopeメソッドでステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        expect(Task.status_sort('完了')).to include(task)
      end
    end

    # # OK
    context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        # ここに内容を記載する
        expect(Task.search_sort('task1')).to include(task)
        expect(Task.status_sort('完了')).to include(task)
      end
    end

  end

end