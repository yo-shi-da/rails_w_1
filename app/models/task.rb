class Task < ApplicationRecord
    validates :name, presence: true
    belongs_to :user

    scope :sort_expired, -> (sort) { order(expired_at: :desc) }
    scope :sort_priority, -> (sort) { order(priority: :asc) }
    
    scope :search_sort, -> (search_sort) { where('name LIKE ?', "%#{search_sort}%") }
    scope :status_sort, -> (status_sort) { where(status: status_sort) }
    scope :and_sort, -> (search_sort, status_sort) { where('name LIKE ?', "%#{search_sort}%").where(status: status_sort) }

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