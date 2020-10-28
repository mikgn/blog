class Post < ApplicationRecord
  include AASM

  self.per_page = 5

  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, through: :post_tags

  scope :active, -> { where(state: :active) }
  scope :sorted_by_newest, -> { order(created_at: :desc) }

  validates :user, presence: true
  validates :title, presence: true
  validates :body, presence: true

  after_commit :get_post_tags, only: [:create, :update]

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

  private

  def get_post_tags
    tags.clear

    "#{title} #{body}".downcase.scan(Tag::REGEX).uniq.each do |tag|
      tag.delete!('#')
      new_tag = Tag.find_or_create_by(name: tag)
      tags << new_tag if tags.exclude?(new_tag)
    end
  end
end
