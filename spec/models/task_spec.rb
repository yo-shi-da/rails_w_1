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
end