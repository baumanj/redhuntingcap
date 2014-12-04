class StepsController < ApplicationController
  before_action :require_signin
  before_action :check_owner

  def update
    @step = Step.find(params[:id])
    if @step.update_attributes(step_params)
      flash[:success] = "Update successful"
      if params[:commit] == "Update"
        redirect_to :back
      elsif params[:commit] == "Send to next step"
        redirect_to new_step_path(@step.candidate)
      end
    else
      # broken
      raise
      # @errors = @step.errors
      # CandidatesController.find(@step.candidate.id, @step)
      # render 'candidates/show' # Try again
    end
  end
  
  def new
    @step = Step.new(candidate_id: params[:candidate_id])
  end

  def create
    @step = Step.new(step_params)
    if @step.save
      flash[:success] = "Now it's #{@step.owner}'s problem!"
      redirect_to @step.candidate
    else
      @errors = @step.errors
      render 'new' # Try again
    end
  end
  
  private

    def step_params
      params.require(:step).permit(:description, :notes, :candidate_id, :owner_id)
    end
    
    def check_owner
      if params[:action] == 'new'
        candidate = Candidate.find(params[:candidate_id])
        step = candidate.steps.last
      elsif params[:action] == 'create'
        candidate = Candidate.find(params[:step][:candidate_id])
        step = candidate.steps.last
      else
        step = Step.find(params[:id])
      end
      if step && step.owner != current_user
        redirect_to root_url, notice: "You don't have the rights to do that."
      end
    end
end
