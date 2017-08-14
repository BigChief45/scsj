class TrialsController < ApplicationController

  before_action :find_trial, only: [:show, :update, :destroy]

  def index
    @trials = Trial.all
  end

  def show
  end

  def new
    @trial = Trial.new
  end

  def create
    @trial = Trial.new(trial_params)

    respond_to do |format|
      if @trial.save
        format.html { redirect_to @trial, flash: { success: 'Juicio creado exitosamente.' } }
      else
        format.html { render 'new', flash: { danger: 'Error al intentar crear juicio.' } }
      end
    end
  end

  private

  def find_trial
    @trial = Trial.find(params[:id])
  end

  def trial_params
    params.require(:trial).permit(:title, :description)
  end

end
