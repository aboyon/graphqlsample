class Project < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :tasks

  validates_uniqueness_of :key
  validates_presence_of :key, :name
end
