class TicketsController < ApplicationController
  before_action :authenticate_technician!

  def index
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
