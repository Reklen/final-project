class AddDescriptionColumnToMentors < ActiveRecord::Migration
  def change
    add_column :mentors, :description, :string
  end
end
