class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :post_must_be_clickbait

  def post_must_be_clickbait
    if title.present? && !title[/Won't Believe|Secret|Top|Guess/]
      errors.add(:title, "must be clickbaity")
    end
  end
end
