class RenameUsersTableToStudents < ActiveRecord::Migration
  def change
    rename_table :users, :students
  end
end
