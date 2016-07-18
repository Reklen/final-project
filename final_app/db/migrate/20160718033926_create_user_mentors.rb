class CreateUserMentors < ActiveRecord::Migration
  def change
    create_table :user_mentors do |t|
      t.references :user, index: true, foreign_key: true
      t.references :mentor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
