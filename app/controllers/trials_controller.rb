class TrialsController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  before_action :find_trial, only: [:show, :edit, :update, :destroy,]

  def index
    @trials = Trial.all.order('created_at DESC')
  end

  def show
  end

  def new
    @trial = Trial.new
    @trial.trial_people.build
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

  def edit
    @trial.trial_people.build
  end

  def update
    params[:trial][:plaintiff_ids] ||= []
    params[:trial][:defendant_ids] ||= []

    respond_to do |format|
      if @trial.update(trial_params)
        format.html { redirect_to @trial, flash: { success: 'Juicio editado exitosamente.' } }
      else
        format.html { render 'edit', flash: { danger: 'Error al tratar de actualizar juicio.' } }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @trial.destroy
        format.html { redirect_to root_path, flash: { success: 'Juicio eliminado exitosamente' } }
      end
    end
  end

  private

  def find_trial
    @trial = Trial.find(params[:id])
  end

  def trial_params
    params.require(:trial).permit(:title, :description, :secret, :start_date, :judge_id, :plaintiffs_lawyer_id, :defendants_lawyer_id, :plaintiff_ids => [], :defendant_ids => [])
  end

end
