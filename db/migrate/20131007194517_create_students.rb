class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :firstname
      t.string :lastname
      t.string :username
      t.string :encrypted_password
      t.string :encrypted_password_confirmation
	  t.string :salt

      t.timestamps
    end
  end
end
