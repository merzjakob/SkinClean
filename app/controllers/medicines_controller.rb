class MedicinesController < ApplicationController
  def show
    @medicine = Medicine.find(params[:id])
  end

  def index
    @medicines = Medicine.all
  end
end
