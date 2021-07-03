require './db/vocabulary/profanity_words.rb'

class Post < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search, against: %i[title body]
  multisearchable against: %i[title body]

  self.per_page = 5

  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :post_tags
  has_many :tags, through: :post_tags

  scope :active, -> { where(active: true) }
  scope :sorted_by_newest, -> { order(created_at: :desc) }
  scope :sorted_by_most_commented, -> { order(comments_count: :desc) }
  scope :last_n_days, ->(days_count) { where('created_at > ?', Date.today - days_count.days) }

  before_validation :check_for_profanity_words

  validates :user, presence: true
  validates :title, presence: true
  validates :body, presence: true

  after_commit :add_post_tags, only: %i[create update]

  private

  def check_for_profanity_words
    [self.title, self.body].each do |atr|
      user_input_to_arr = atr.split(/[^[[:word:]]]+/)
      unless user_input_to_arr.size == (user_input_to_arr - PROFANITY_WORDS).size
        errors.add(:profanity_words_detector, '- Please check your text before saving')
      end
    end
  end

  def add_post_tags
    tags.clear

    "#{title} #{body}".downcase.scan(Tag::REGEX).uniq.each do |tag|
      tag.delete!('#')
      new_tag = Tag.find_or_create_by(name: tag)
      tags << new_tag if tags.exclude?(new_tag)
    end
  end
end
