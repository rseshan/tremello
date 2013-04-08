class Musician < ActiveRecord::Base
	has_secure_password

  attr_accessible :bio, :email, :name, :bands_attributes, :password, :password_confirmation

  has_many :memberships
  has_many :bands, :through => :memberships 

  accepts_nested_attributes_for :bands

  validates_uniqueness_of :email
 
SOUNDCLOUD_CLIENT_ID     = 'd276b5f3aa390cae2ebfbc0c52f1f58d'
  SOUNDCLOUD_CLIENT_SECRET = '025dcc8c1b6453919de0668afaf101ea'

  def self.soundcloud_client(options={})
    options = {
      :client_id     => SOUNDCLOUD_CLIENT_ID,
      :client_secret => SOUNDCLOUD_CLIENT_SECRET,
    }.merge(options)

    Soundcloud.new(options)
  end
  
  
  def soundcloud_client(options={})
    options= {
      :expires_at    => soundcloud_expires_at,
      :access_token  => soundcloud_access_token,
      :refresh_token => soundcloud_refresh_token
    }.merge(options)
    
    client = self.class.soundcloud_client(options)
    
    # define a callback for successful token exchanges
    # this will make sure that new access_tokens are persisted once an existing 
    # access_token expired and a new one was retrieved from the soundcloud api
    client.on_exchange_token do
      self.update_attributes!({
        :soundcloud_access_token  => client.access_token,
        :soundcloud_refresh_token => client.refresh_token,
        :soundcloud_expires_at    => client.expires_at,
      })
    end
    
    client
  end
end