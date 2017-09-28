class TicketsController < ApplicationController
  before_action :authenticate_technician!
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = Ticket.all
    respond_to :html, :json
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new ticket_params
    @ticket.owner = current_technician

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'The ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    @ticket.assign_attributes(ticket_params)
    @ticket.resolver = current_technician if @ticket.resolution_changed?

    respond_to do |format|
      if @ticket.save(ticket_params)
        format.html { redirect_to @ticket, notice: 'The ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #hummm nop

    # @ticket.destroy
    # respond_to do |format|
    #   format.html { redirect_to tickets_url, notice: 'The ticket was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    def set_ticket
      @ticket = Ticket.includes(:owner, :assignee, :resolver).find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:id, :title, :owner, :status, :requester_name, :requester_email, :requester_phone, :requester_details, :description, :impact, :urgency, :technician_actions, :level_support, :impacted_service, :resolution, :assignee_id)
    end
end
