class Task < ApplicationRecord
    validates :name, presence: true

    scope :sort_tasks, -> (sort) { order(expired_at: :desc) }
end