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