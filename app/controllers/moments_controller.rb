class MomentsController < ApplicationController
  before_action :set_moment, only: [:show, :update, :destroy]

  # GET /moments
  # GET /moments.json
  def index
    @moments = Moment.all
  end

  # GET /moments/1
  # GET /moments/1.json
  def show
  end

  # POST /moments
  # POST /moments.json
  def create
    @moment = Moment.new(moment_params)

    if @moment.save
      render :show, status: :created, location: @moment
    else
      render json: @moment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /moments/1
  # PATCH/PUT /moments/1.json
  def update
    if @moment.update(moment_params)
      render :show, status: :ok, location: @moment
    else
      render json: @moment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /moments/1
  # DELETE /moments/1.json
  def destroy
    @moment.destroy
  end

  def process_sms
    moment = Moment.create(body: params[:Body].strip, phone: params[:From], twilio_id: params[:MessageSid])
    respond_to do |format|
      format.xml  { head :ok }
      format.json { head :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moment
      @moment = Moment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def moment_params
      params.require(:moment).permit(:user_id, :phone, :body, :twilio_id)
    end
end
