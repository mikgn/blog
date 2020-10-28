class Post < ApplicationRecord
  include AASM

  self.per_page = 5

  has_many :comments
  belongs_to :user
  has_and_belongs_to_many :tags

  scope :active, -> { where(state: :active) }
  scope :sorted_by_newest, -> { order(created_at: :desc) }

  validates :user, presence: true
  validates :title, presence: true
  validates :body, presence: true

  aasm column: :state do
    state :active, initial: true
    state :pending

    event :deactivate do
      transitions to: :pending, from: :active
    end
    event :activate do
      transitions to: :active, from: :pending
    end
  end
end
