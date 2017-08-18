class TrialPresentationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_trial

  def create
    @trial_presentation = @trial.trial_presentations.build(trial_presentation_params)

    respond_to do |format|
      if @trial_presentation.save
        format.html { redirect_to @trial, flash: { success: 'Presentacion ingresada exitosamente.' } }
      else
        format.html { redirect_to @trial, flash: { danger: 'Error al tratar de ingresar su presentacion.' } }
      end
    end
  end

  private

  def find_trial
    @trial = Trial.find(params[:trial_id])
  end

  def trial_presentation_params
    params.require(:trial_presentation).permit(:description, :lawyer_id)
  end
end
