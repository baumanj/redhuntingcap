class Candidate < ActiveRecord::Base
  belongs_to :recruiter, class_name: "User"
  belongs_to :owner, class_name: "User"
  has_many :steps

  def alias
    # recruiter.name.split(" ").each {|n| n.first}.join + id.to_s
    name
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
