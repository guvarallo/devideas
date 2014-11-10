class AddIdeaIdToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :idea_id, :integer
  end
end
