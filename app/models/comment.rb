class Comment < ApplicationRecord
  default_scope -> { includes(:user) }

  belongs_to :user, counter_cache: true
  belongs_to :post, counter_cache: true

  before_validation :check_for_profanity_words

  validates :user, presence: true
  validates :post, presence: true
  validates :text, presence: true

  private

  def check_for_profanity_words
    user_input_to_arr = text.split(/[^[[:word:]]]+/)
    unless user_input_to_arr.size == (user_input_to_arr - PROFANITY_WORDS).size
      errors.add(:profanity_words_detector, '- Please check your text before saving')
    end
  end
end
