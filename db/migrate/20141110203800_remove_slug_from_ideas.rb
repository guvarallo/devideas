class RemoveSlugFromIdeas < ActiveRecord::Migration
  def change
    remove_column :ideas, :slug, :string
  end
end
