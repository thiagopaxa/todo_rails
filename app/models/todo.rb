class Todo < ActiveRecord::Base
  belongs_to :user

  has_many :tasks
  accepts_nested_attributes_for :tasks, allow_destroy: true

  validates_presence_of :title

end
