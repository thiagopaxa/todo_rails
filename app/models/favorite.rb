class Favorite < ActiveRecord::Base
  belongs_to :following_user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :favorite_todo,  class_name: 'Todo', foreign_key: 'todo_id'
end
