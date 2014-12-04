class Candidate < ActiveRecord::Base
  belongs_to :recruiter, class_name: "User"
  belongs_to :owner, class_name: "User"
  
  def alias
    # recruiter.name.split(" ").each {|n| n.first}.join + id.to_s
    name
  end
end
