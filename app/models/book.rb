class Book < ActiveRecord::Base
  belongs_to :genre

  has_many :roles
  has_many :authors, :through => :roles
  has_many :reviews
end
