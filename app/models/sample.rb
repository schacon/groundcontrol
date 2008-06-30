=begin
| id          | int(11)      | NO   | PRI | NULL    | auto_increment | 
| exercise_id | int(11)      | YES  | MUL | NULL    |                | 
| page_id     | int(11)      | YES  |     | NULL    |                | 
| passed      | tinyint(1)   | YES  |     | NULL    |                | 
| user        | int(11)      | YES  |     | NULL    |                | 
| response    | int(11)      | YES  |     | NULL    |                | 
| time        | float        | YES  |     | NULL    |                | 
| created_at  | datetime     | YES  |     | NULL    |                | 
| updated_at  | datetime     | YES  |     | NULL    |                | 
| page_data   | varchar(255) | YES  |     | NULL    |                | 
| page_size   | int(11)      | YES  |     | NULL    |                | 
| memory      | float        | YES  |     | NULL    |                | 
=end

class Sample < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :page
  
  named_scope :rev, :order => 'created_at DESC'
  
end