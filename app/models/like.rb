class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea

  validates_uniqueness_of :user, scope: [:user_id]

end