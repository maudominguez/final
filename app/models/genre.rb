class Genre < ActiveRecord::Base
  has_many :books

  validates :name, presence: true, length: { maximum: 100 }
  validates :description, length: { maximum: 400}
end
