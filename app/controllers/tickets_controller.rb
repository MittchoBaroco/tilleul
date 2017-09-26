class TicketsController < ApplicationController
  before_action :authenticate_technician!

  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new ticket_params

    if @ticket.save
      redirect_to @ticket
    else
      render 'new'
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])

    if @ticket.update ticket_params
      redirect_to @ticket
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
    def ticket_params
      params.require(:ticket).permit(:id, :title, :owner, :status, :requester_name, :requester_email, :requester_phone, :requester_details, :description, :impact, :urgency, :technician_actions, :level_support, :impacted_service)
    end
end
