class Task < ActiveRecord::Base
  belongs_to :todo
  validates_presence_of :body
end
