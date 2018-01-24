class ClientsController < ApplicationController
  before_action :authenticate_user!, :except => [:new, :create, :show] #Adding acception to authentication. anybody can create client
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    authorize_admin
    @clients = Client.all
    @users = User.all

    respond_to do |format|
      format.html
      format.pdf do
        send_data generate_clients_report(@tasks), filename: 'clients.pdf',
                                                 type: 'application/pdf',
                                                 disposition: 'attachment'
      end
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    authorize_admin
  end

  # GET /clients/new
  def new
    @client = Client.new
    #@users = User.all
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
    if current_user.id != @client.counselor_id && current_user.admin? == false
      redirect_to root_path, alert: 'Admins only!'
    end
    @clients = Client.all
    @users = User.all # used in client->edit @users.collect
  end

  # POST /clients
  # POST /clients.json
  def create
    # created clients are assigned to the admin
    #@user = User.find_by_role(1)
    #@client.assign_default_counselor
    #@client.counselor_id = @user.id

    if (params[:autofill])
      @client = Client.new
      @client.first_name = "Bob"
      @client.age = 27
      @client.last_name = "Smith"
      @client.dob = DateTime.now
      @client.phone_number = "541-000-0000"
      @client.leave_message = true
      @client.email = "bob@gmail.com"
      @client.occupation = "occupation"
      @client.employer = "employer"
      @client.employer_address = "employer_address"
      @client.work_phone = "work_phone"
      @client.leave_message_work = false
      @client.spouse_first_name = "spouse_first_name"
      @client.spouse_last_name = "spouse_last_name"
      @client.spouse_dob = DateTime.now
      @client.spouse_occupation = "spouse_occupation"
      @client.spouse_employer = "spouse_employer"
      @client.spouse_phone = "spouse_phone"
      @client.emergency_name = "emergency_name"
      @client.emergency_relation = "emergency_relation"
      @client.emergency_address = "emergency_address"
      @client.emergency_phone = "emergency_phone"
      @client.health_insurance = true
      @client.insurance_company = "insurance_company"
      @client.physician = "physician"
      @client.physician_phone = "physician_phone"
      @client.medication = "medication"
      @client.counselor_seen_before = false
      @client.counselor_seen = "counselor_seen"
      @client.help_reason = "help_reason"
    else
      @client = Client.new(client_params)
    end

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
    # precautionary: post would need to be sent from postman?
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
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
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
      params.require(:client).permit(:first_name, :age, :last_name, :counselor_id, :dob, :phone_number,
        :leave_message, :email, :occupation, :employer, :employer_address, :work_phone,
        :leave_message_work, :spouse_first_name, :spouse_last_name, :spouse_dob, :spouse_occupation,
        :spouse_employer, :spouse_phone, :emergency_name, :emergency_relation, :emergency_address,
        :emergency_phone, :health_insurance, :insurance_company, :physician, :physician_phone,
        :medication, :counselor_seen_before, :counselor_seen, :help_reason, :previous_counselor)
    end

    def generate_clients_report(tasks)
      report = Thinreports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'client', 'list.tlf')

      clients = Client.all
      clients.each do |client|
        report.list.add_row do |row|
          row.values no: client.id,
                     name: client.first_name,
                     due_date: "due_date",
                     state: 'done'
          #row.item(:name).style(:color, 'red') unless task.done?
        end
      end

      report.generate
    end
end
