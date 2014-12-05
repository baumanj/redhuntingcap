class CandidatesController < ApplicationController
  before_action :require_signin

  def index
    candidates = Step.where(owner: current_user).map do |s| 
      s.candidate
    end.reject {|c| c.inactive? }.uniq
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
  
  def new
    @candidate = Candidate.new
  end

  def create
    Candidate.transaction do
      Step.transaction do
        @candidate = Candidate.new(candidate_params)
        if @candidate.save
          first_step = Step.new(candidate: @candidate,
                                owner: @candidate.recruiter,
                                description: 'Triage candidate')
          if first_step.save
            flash[:success] = "#{@candidate} created!"
            redirect_to @candidate
            return
          end
        end
        @errors = @candidate.errors
        render 'new' # Try again
      end
    end
  end
  
  def edit
    @candidate = Candidate.find(params[:id])
  end
  
  def update
    @candidate = Candidate.find(params[:id])
    if @candidate.update_attributes(candidate_params)
      flash[:success] = "Update successful"
      redirect_to @candidate
    else
      @errors = @candidate.errors
      render 'edit' # Try again
    end
  end

  private

    def candidate_params
      params.require(:candidate).permit(:name, :email, :resume_url, :phone, :recruiter_id, :inactive)
    end
  
end
