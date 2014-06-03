class Status < ActiveRecord::Base
  attr_accessible :name, :content, :id

  belongs_to :user
end
