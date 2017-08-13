class TrialsController < ApplicationController

  before_action :find_trial, except: [:index, :create]

  def index
    @trials = Trial.all
  end

  def show
  end

  private

  def find_trial
    @trial = Trial.find(params[:id])
  end

end
