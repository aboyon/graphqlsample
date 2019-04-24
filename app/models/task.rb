class Task < ApplicationRecord
  belongs_to :project
  has_many :assignments
  has_many :users, :through => :assignments

  validates_presence_of :name

  STATUS = {
    :pending => 'pending',
    :in_progress => 'in_progress',
    :completed => 'completed'
  }.freeze

  before_create :ensure_status

  scope :pending, -> { where(:status => STATUS[:pending]) }
  scope :in_progress, -> { where(:status => STATUS[:in_progress]) }
  scope :completed, -> { where(:status => STATUS[:completed]) }
  scope :for_user, -> (user_id) { joins(:assignments).where("assignments.user_id = ?", user_id) }

  def assigned_to
    assignments.order('created_at DESC').first.user
  end

  private

    def ensure_status
      self.status ||= STATUS[:pending]
    end
end
