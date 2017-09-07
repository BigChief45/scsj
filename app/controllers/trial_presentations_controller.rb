class TrialPresentationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_trial

  authorize_resource

  def create
    @trial_presentation = @trial.trial_presentations.build(trial_presentation_params)

    respond_to do |format|
      if @trial_presentation.save
        format.html { redirect_to @trial, flash: { success: t('.success') } }
      else
        format.html { render 'trials/show', flash: { danger: t('.error') } }
      end
    end
  end

  private

  def find_trial
    @trial = Trial.find(params[:trial_id])
  end

  def trial_presentation_params
    params.require(:trial_presentation).permit(
      :description,
      :user_id,
      { attachments: [] }
    )
  end
end
