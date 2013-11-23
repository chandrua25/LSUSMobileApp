class Subject < ActiveRecord::Base
  attr_accessible :endtime, :name, :starttime, :student_id
  belongs_to :students
  
end
