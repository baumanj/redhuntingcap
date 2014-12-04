class CandidatesController < ApplicationController
  def index
    candidates = Step.where(owner: current_user).map {|s| s.candidate }.uniq
    @todo, @other = candidates.partition do |candidate|
      candidate.owner == current_user
    end
  end

  def show
    @candidate = Candidate.find(params[:id])
    steps = @candidate.steps
    @step = steps.last
    @history = steps[0...-1]
  end
end
