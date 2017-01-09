class LinksController < ApplicationController

  HOST_NAME = 'http://localhost:3000/'
  # GET /links
  # GET /links.json
  def index
    @ulinks = Userlink.all
  end

  # GET /links/new
  def new
    @links = Link.new
  end
  
  def show
    user_id = Base58.decode(params[:user_id])
    id = Base58.decode(params[:encoded_id])

    @link = Link.find(id)
    if @link
      if redirect_to @link.long_url
        @link.clicks += 1
        @link.save
      end           
    else      
      redirect_to HOST_NAME
    end
  end  

  def shorten        
    ldata = Link.find_by_long_url(params[:long_url])
    if !ldata 
      ldata = Link.create(:long_url => params[:long_url])      
    end
    @surl = HOST_NAME + params[:user_id] + "/" + Base58.encode(ldata.id)
    
    ulink = Userlink.find_by_url(@surl)
    if !ulink
      Userlink.create(:url => @surl, :user_id => params[:user_id], :link_id => ldata.id)
    end

    render :json => { :data => @surl }
  end
  
end
