class Task < ApplicationRecord
    validates :name, presence: true

    scope :sort_tasks, -> (sort) { order(expired_at: :desc) }

    enum status: {
        未着手: 1, 
        着手中: 2, 
        完了: 3
    }

    enum priority: {
        高: 1, 
        中: 2, 
        小: 3
    }

end