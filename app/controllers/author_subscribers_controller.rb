class AuthorSubscribersController < ApplicationController
  before_action :set_author_subscriber, only: %i[ show edit update destroy ]

  # GET /author_subscribers or /author_subscribers.json
  def index
    @author_subscribers = AuthorSubscriber.all
  end

  # GET /author_subscribers/1 or /author_subscribers/1.json
  def show
  end

  # GET /author_subscribers/new
  def new
    @author_subscriber = AuthorSubscriber.new
  end

  # GET /author_subscribers/1/edit
  def edit
  end

  # POST /author_subscribers or /author_subscribers.json
  def create
    @author_subscriber = AuthorSubscriber.new(author_subscriber_params)

    respond_to do |format|
      if @author_subscriber.save
        format.html { redirect_to author_subscriber_url(@author_subscriber), notice: "Author subscriber was successfully created." }
        format.json { render :show, status: :created, location: @author_subscriber }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @author_subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /author_subscribers/1 or /author_subscribers/1.json
  def update
    respond_to do |format|
      if @author_subscriber.update(author_subscriber_params)
        format.html { redirect_to author_subscriber_url(@author_subscriber), notice: "Author subscriber was successfully updated." }
        format.json { render :show, status: :ok, location: @author_subscriber }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @author_subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /author_subscribers/1 or /author_subscribers/1.json
  def destroy
    @author_subscriber.destroy!

    respond_to do |format|
      format.html { redirect_to author_subscribers_url, notice: "Author subscriber was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author_subscriber
      @author_subscriber = AuthorSubscriber.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def author_subscriber_params
      params.require(:author_subscriber).permit(:author_id, :subscriber_id)
    end
end
