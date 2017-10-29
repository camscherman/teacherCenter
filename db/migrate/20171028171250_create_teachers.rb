class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, index: true
      t.string :password_digest
      t.boolean :is_nst
      t.boolean :admin

      t.timestamps
    end
  end
end
