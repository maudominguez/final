class Author < ActiveRecord::Base
  has_many :roles
  has_many :books, :through => :roles

  validates :name, presence: true, length: { maximum: 100 }
end
