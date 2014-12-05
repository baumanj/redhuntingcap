class Step < ActiveRecord::Base
  belongs_to :candidate, class_name: "Candidate"
  belongs_to :owner, class_name: "User"
  default_scope { order('id ASC') }
  
  validates :description, presence: true
  validates :owner, presence: true

  def to_s
    description
  end
  
  def next
    self.class.where(candidate: candidate).where("id != ?", id).first
  end
  
  # XXX Why did this not work with after_commit?
  after_save do
    if new_record? || owner_id_changed?
      rv = Notifications.became_owner(self).deliver
    end
  end
  
end
