class VersionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client_and_version, only: [:diff, :rollback, :destroy]

  def diff
  end

  def rollback
    # change the current client to the specified version
    # reify gives you the object of this version
    client = @version.reify
    client.save
    redirect_to pages_adminhome_url
  end

  private

    def set_client_and_version
      puts params
      @client = Client.find(params[:client_id])
      @version = @client.versions.find(params[:id])
      puts @client
      puts @version
    end

end
