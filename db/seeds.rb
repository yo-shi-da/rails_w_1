addresses = [ 
    "a@com.jp", "b@com.jp", "c@com.jp"
]

name = [
    a,b,c
]

# 各ユーザーの作成
addresses.each_with_index {|address, name|
    User.create(name: name, email: address, password: '000000', password_confirmation: '000000', admin: false)
}

# 管理者ユーザーの作成
User.create(name: "admin", email: "admin@com.jp", password: "000000", password_confirmation: "000000", admin: true)