FactoryBot.define do

  # 一般ユーザー
  factory :user do
    name { 'テストユーザー' }
    email { 'test1@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    admin { 'true' }
  end

  # # 管理ユーザー
  # factory :user do
  #   name { 'テストユーザー' }
  #   email { 'test1@example.com' }
  #   password { 'password' }
  #   password_confirmation { 'password' }
  #   admin { 'true' }
  # end

end