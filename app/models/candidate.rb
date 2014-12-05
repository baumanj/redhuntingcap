class Candidate < ActiveRecord::Base
  belongs_to :recruiter, class_name: "User"
  belongs_to :owner, class_name: "User"
  has_many :steps

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@([a-z\d\-]+\.)+[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  validates :phone, presence: true, uniqueness: { case_sensitive: false }
  validates :resume_url, presence: true, uniqueness: { case_sensitive: false }

  def alias
    # recruiter.name.split(" ").each {|n| n.first}.join + id.to_s
    name
  end
  
  def to_s
    self.alias
  end
    
  def next_step
    Step.where(candidate: self).last
  end

  def owner
    next_step.owner
  end

  def owner=(user)
    next_step.update_attribute(:owner, user)
  end
  
  def urgency
    if steps.last.updated_at > 30.minutes.ago
      "normal"
    elsif steps.last.updated_at > 1.hour.ago
      "medium"
    else
      "high"
    end
  end
end
