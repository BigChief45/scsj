class TrialsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_trial, only: [:show, :edit, :update, :destroy]

  authorize_resource

  def index
    @trials = Trial.all.order('created_at DESC')

    # Search
    @q = @trials.ransack(params[:q])
    @trials = @q.result(distinct: true).order('created_at DESC')
  end

  def show
    @presentation = @trial.trial_presentations.build
  end

  def new
    @trial = Trial.new
    @trial.trial_people.build
  end

  def create
    @trial = Trial.new(trial_params)

    respond_to do |format|
      if @trial.save
        format.html { redirect_to @trial, flash: { success: t('.success') } }
      else
        format.html { render 'new', flash: { danger: t('.error') } }
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
        format.html { redirect_to @trial, flash: { success: t('.success') } }
      else
        format.html { render 'edit', flash: { danger: t('.error') } }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @trial.destroy
        format.html { redirect_to root_path, flash: { success: t('.success') } }
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
