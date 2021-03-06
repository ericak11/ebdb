class ConnectionsController < ApplicationController
  before_action :set_connection, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  # GET /connections
  # GET /connections.json
  def index
    user = User.find(params[:user_id])
    connections = user.connections.map { |x|  User.find(x.relation_id)}
    relations = user.relations.map { |x|  User.find(x.user_id)}
    @connections = (connections + relations).uniq
    respond_to do |format|
      format.json {render json: @connections}
      format.html {render :index}
    end
  end

  # GET /connections/1
  # GET /connections/1.json
  def show
  end

  # GET /connections/new
  def new
    @connection = Connection.new
  end

  # GET /connections/1/edit
  def edit
  end

  # POST /connections
  # POST /connections.json
  def create

    @connection = Connection.new(connection_params)
    @connection.user_id = @user.id
    respond_to do |format|
      if @connection.save
        format.html { redirect_to @connection, notice: 'Connection was successfully created.' }
        format.json { render :show, status: :created, location: @connection }
      else
        format.html { render :new }
        format.json { render json: @connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /connections/1
  # PATCH/PUT /connections/1.json
  def update
    respond_to do |format|
      if @connection.update(connection_params)
        format.html { redirect_to @connection, notice: 'Connection was successfully updated.' }
        format.json { render :show, status: :ok, location: @connection }
      else
        format.html { render :edit }
        format.json { render json: @connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /connections/1
  # DELETE /connections/1.json
  def destroy
    @connection.destroy
    respond_to do |format|
      format.html { redirect_to user_connections_url(@user), notice: 'Connection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_connection
      @connection = Connection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def connection_params
      params.require(:connection).permit(:rating, :date, :location, :comments, :relation_id, :user_id)
    end

    def set_user
      @user = User.find(session[:user_id])
    end
end
