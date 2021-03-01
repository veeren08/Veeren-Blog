
class Article < ApplicationRecord
  has_many :comments, dependent: :destroy

  # validates :title, presence: true
  # validates :title, :uniqueness => true
  # validates :title, :length => { :minimum => 5 }
  # validates :body, presence: true, length: { minimum: 10 }
  validate :start_with_title
  # validates :title, presence:true, length: { minimum: 10 }

  private
  def start_with_title
    if not title.start_with?("The")
      errors.add(:title, "Title must start with 'The'")
    end
    if title.include?('@')
      errors.add(:title, "title not contain these symbol")
    end
  end
end
