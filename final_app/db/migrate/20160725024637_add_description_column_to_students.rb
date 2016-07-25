class AddDescriptionColumnToStudents < ActiveRecord::Migration
  def change
    add_column :students, :description, :string
  end
end
