addresses = [ 
    "a@com.jp", "b@com.jp", "c@com.jp"
]

# 各ユーザーの作成
addresses.each_with_index {|address, i|
    User.create(name: i, email: address, password: '000000', password_confirmation: '000000', admin: false)
}

# 管理者ユーザーの作成
User.create(name: "admin", email: "admin@com.jp", password: "000000", password_confirmation: "000000", admin: true)