class AddMentorColumnToStudents < ActiveRecord::Migration
  def change
    add_column :students, :mentor_id, :string
  end
end
