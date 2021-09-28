# テーブルスキーマ

- user  

| | column | date | 
| --- | --- | --- | 
| | id ||
| | name | string | 
| | email | string | 
| | password_digest | string | 
  
- task

| | column | date | 
| --- | --- | --- | 
| | id ||
| | name | string | 
| | description | text | 
| FK | user_id |  | 
  
- label

| | column | date | 
| --- | --- | --- | 
| | id ||
| | name | string | 
| FK | user_id |  | 
  
- labelling

| | column | date | 
| --- | --- | --- | 
| | id ||
| FK | task_id |  | 
| FK | label_id |  | 

# herokuへのデプロイ方法

1.ログインする  
heroku login  

2.新しいアプリケーションを作成  
heroku create

3.アセットプリコンパイルをする  
rails assets:precompile RAILS_ENV=production

4.bunderのバージョンのlock解除する。(環境によっては不要)  
bundle lock --add-platform x86_64-linux

5.ステージする  
git add -A  

6.コミットする  
git commit -m "コメント"

7.Heroku buildpackを追加する  
heroku buildpacks:set heroku/ruby  
heroku buildpacks:add --index 1 heroku/nodejs

8.デプロイする  
git push heroku master

9.マイグレーション実行  
heroku run rails db:migrate