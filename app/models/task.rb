class Task < ApplicationRecord
  belongs_to :project
  has_many :assignments
  has_many :users, :through => :assignments

  STATUS = {
    :pending => 'pending',
    :in_progress => 'in_progress',
    :completed => 'completed'
  }.freeze

  validates_presence_of :name, :status
  validates_inclusion_of :status, :in => self::STATUS.values, :message => "%{value} is not a valid status"

  before_create :ensure_status

  scope :for_user, -> (user_id) { joins(:assignments).where("assignments.user_id = ?", user_id) }

  private

    def ensure_status
      self.status ||= STATUS[:pending]
    end
end
