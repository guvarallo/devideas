class Idea < ActiveRecord::Base
  
  belongs_to :user
  has_many   :likes

  validates :description, presence: true, length: { maximum: 140 }

  def total_likes
    like - unlike
  end

  def like
    self.likes.where(like: true).size
  end

  def unlike
    self.likes.where(like: false).size
  end
  
end