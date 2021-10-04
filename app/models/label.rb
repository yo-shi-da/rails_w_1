class Label < ApplicationRecord
  has_many :labellings, dependent: :destroy
  has_many :tasks_label, through: :labellings, source: :task
end
