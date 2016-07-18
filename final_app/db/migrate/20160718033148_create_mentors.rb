class CreateMentors < ActiveRecord::Migration
  def change
    create_table :mentors do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :age
      t.string :location
      t.string :expertise
      t.string :availability
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
