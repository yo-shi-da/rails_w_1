FactoryBot.define do
  factory :task do
    name { 'test_name' }
    description { 'test_description' }
    expired_at { '002021-01-01' }
    status { '未着手' }
    priority { '中' }
    user
    # expired_at { 'test_expired_at' } #これでもテスクをクリアする。
  end
end