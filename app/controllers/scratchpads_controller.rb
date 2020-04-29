class ScratchpadsController < ApplicationController
  before_action :set_scratchpad, only: [:show, :update, :destroy]

  # GET /scratchpads
  def index
    @scratchpads = Scratchpad.all

    render json: @scratchpads
  end

  # GET /scratchpads/1
  def show
    render json: @scratchpad
  end

  # POST /scratchpads
  def create
    @scratchpad = Scratchpad.new(scratchpad_params)

    if @scratchpad.save
      render json: @scratchpad, status: :created, location: @scratchpad
    else
      render json: @scratchpad.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /scratchpads/1
  def update
    if @scratchpad.update(scratchpad_params)
      render json: @scratchpad
    else
      render json: @scratchpad.errors, status: :unprocessable_entity
    end
  end

  # DELETE /scratchpads/1
  def destroy
    @scratchpad.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scratchpad
      @scratchpad = Scratchpad.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def scratchpad_params
      params.require(:scratchpad).permit(:text)
    end
end
