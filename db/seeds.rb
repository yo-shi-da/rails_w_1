

# 管理者ユーザーの作成
User.create(name: "admin", email: "admin@com.jp", password: "000000", password_confirmation: "000000", admin: true)


# ラベル
labels = [
	"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"
]

# ラベル作成
labels.each_with_index {|label|
	Label.create(name: label)
}

names = [
	"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"
]

# タスク作成
User.all.each do |user|
	names.each_with_index do |name|
		user.tasks.create!(
			name: name,
			description: 'テキスト',
			expired_at: '2021-12-31',
			status: '完了',
			priority: '高'
		)
	end
end

# メールアドレス
addresses = [ 
		"a@com.jp", "b@com.jp", "c@com.jp", "d@com.jp", "e@com.jp", "f@com.jp", "g@com.jp", "h@com.jp", "i@com.jp", "j@com.jp", "k@com.jp", "l@com.jp", "m@com.jp", "n@com.jp", 
		"o@com.jp", "p@com.jp", "q@com.jp", "r@com.jp", "s@com.jp", "t@com.jp", "u@com.jp", "v@com.jp", "w@com.jp", "x@com.jp", "y@com.jp", "z@com.jp",
]

# 各ユーザーの作成
addresses.each_with_index {|address, i|
		User.create(name: i, email: address, password: '000000', password_confirmation: '000000', admin: false)
}