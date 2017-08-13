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

  private

  def find_trial
    @trial = Trial.find(params[:id])
  end

end
