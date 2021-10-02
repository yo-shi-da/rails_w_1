describe 'ユーザー機能' do

	# 
	describe 'ユーザー登録' do
		context 'ユーザを新規登録した時' do
			before do
				FactoryBot.create(:user, name: "ユーザーA", email: "a@example.com", password: "password", password_digest: "password")
			end

			it '正常に登録される' do
			【テストの処理（〇〇になることを期待する）】
			end
		end
	end
	
end