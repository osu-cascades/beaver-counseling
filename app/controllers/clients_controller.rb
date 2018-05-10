class ClientsController < ApplicationController
  before_action :authenticate_user!, :except => [:new, :create, :show] #Adding acception to authentication. anybody can create client
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :set_paper_trail_whodunnit

  def notes
    # authorize counselor

    #puts "what is the id"
    #puts @client.id
    #puts params[:id]

    # this isn't working
    #if (current_user.admin? == false) # || @client.id != current_user.id )
    #  redirect_to root_path, alert: 'Admins only!'
    #end
  end

  # GET /clients
  # GET /clients.json
  def index
    authorize_admin
    @clients = Client.all
    @users = User.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    # how do we know if the form was created?
    if current_user.nil?
      return
    end
    authorize_admin
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
    if current_user.id != @client.counselor_id && current_user.admin? == false
      redirect_to root_path, alert: 'Admins only!'
    end
    @clients = Client.all
    @users = User.all # used in client->edit @users.collect
    @family_member = FamilyMember.all
  end

  # POST /clients
  # POST /clients.json
  def create
    #puts request.raw_post
    #puts params[:sig]

    if (params[:autofill])
      @client = Client.new
      @client.first_name = "Bob"
      @client.last_name = "Smith"
      @client.dob = DateTime.now
      @client.phone_number = "541-000-0000"
      @client.emergency_name = "Mom"
      @client.emergency_relation = "Mother"
      @client.emergency_phone = '999-888-7777'
      @client.insurance_company = "aflac"
      @client.counselor_seen_before = false
    else
      @client = Client.new(client_params)
      puts client_params
    end

    #@client.upload_image(params[:sig])

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    @client = Client.find(params[:id])
    if current_user.id != @client.counselor_id && current_user.admin? == false
      redirect_to root_path, alert: 'Admins only!'
    end

    # only the admin can change the user the client is assigned to
    respond_to do |format|
      if (@client.counselor_id != params[:client][:counselor_id] && !@client.counselor_id.nil?)
        @client.previous_counselor.push(User.find(@client.counselor_id).name)#if so add counselor name
      end
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        @users = User.all # used in client->edit @users.collect
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm_archive
    @client = Client.find(params[:id])
    if current_user.nil?
      return
    end
    authorize_admin
  end

  def archive
    puts request.raw_post
    @client = Client.find(params[:id])
    @client.is_archived = true
    respond_to do |format|
    if @client.save
        format.html { redirect_to admin_adminhome_path, notice: 'Client was successfully archived.' }
      else
        format.html { redirect_to admin_adminhome_path, notice: 'Client was not archived.' }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    def authorize_admin
      if (current_user.admin? == false)
        redirect_to root_path, alert: 'Admins only!'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:first_name, :last_name, :counselor_id, :dob, :phone_number,
        :leave_message, :email, :occupation, :employer,:is_archived,
        :emergency_name, :emergency_relation, :sig,
        :emergency_phone, :insurance_company, :physician, :physician_phone,
        :medication, :counselor_seen_before, :counselor_seen, :previous_counselor, :custom_id,
        :local_address, :phone_type, :email_leave_message, :highest_edu, :identified_gender,
        :culture_background, :sexual_orientation, :relationship, :how_referred, :accepted, :referral_to,
        family_members_attributes: [:id, :name, :dob, :relation, :_destroy])
    end
end
