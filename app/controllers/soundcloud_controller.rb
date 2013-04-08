class SoundcloudController < ApplicationController
	skip_before_filter :login_required


  def connect
    redirect_to soundcloud_client.authorize_url()
  end

  def connected
  
      soundcloud_client.exchange_token(:code => params[:code])
      @me = soundcloud_client.get("/me")
      @tracks = soundcloud_client.get("/me/tracks")
      
      # login_as Musician.find_or_create_by_soundcloud_user_id({
      #   :soundcloud_user_id  => me.id,
      #   :soundcloud_username => me.username
      # })

      # current_user.update_attributes!({
      #   :soundcloud_access_token  => soundcloud_client.access_token,
      #   :soundcloud_refresh_token => soundcloud_client.refresh_token,
      #   :soundcloud_expires_at    => soundcloud_client.expires_at,
      # })
    # end
    # render :layout => false
  end

  def disconnect
    login_as nil
    redirect_to root_path
  end
  
private

  def soundcloud_client
    return @soundcloud_client if @soundcloud_client
    @soundcloud_client = Musician.soundcloud_client(:redirect_uri  => soundcloud_connected_url)
  end


end