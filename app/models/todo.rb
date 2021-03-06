class Todo < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :todo, presence: true, length: { maximum: 20 }
end
