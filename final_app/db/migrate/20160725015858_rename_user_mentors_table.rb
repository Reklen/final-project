class RenameUserMentorsTable < ActiveRecord::Migration
  def change
    rename_table :user_mentors, :pairs
  end
end
