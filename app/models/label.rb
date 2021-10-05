class Label < ApplicationRecord
  has_many :labellings, dependent: :destroy
  # has_many :tasks_label(この名前だとParametersで拒否される), through: :labellings, source: :task
  has_many :tasks, through: :labellings
end
