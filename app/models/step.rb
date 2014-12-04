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
end
