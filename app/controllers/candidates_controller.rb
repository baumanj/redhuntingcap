class CandidatesController < ApplicationController
  def index
    # Need to query this down to candidates user has involvement with
    # Steps.where(owner: current_user).map {|s| s.candidate }.uniq
    @todo, @other = Candidate.all.partition do |candidate|
      candidate.owner == current_user
    end
  end

  def show
    @candidate = Candidate.find(params[:id])
  end
end
