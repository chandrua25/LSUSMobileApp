class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
	  t.integer :student_id
      t.time :starttime
      t.time :endtime

      t.timestamps
    end
  end
end
