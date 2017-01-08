class LinksController < ApplicationController

  HOST_NAME = 'http://localhost:3000/'
  # GET /links
  # GET /links.json
  def index
    @links = Link.all
  end

  # GET /links/new
  def new
    @links = Link.new
  end

  # GET /links/1
  # GET /links/1.json
  def show
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
    if ldata 
      @surl = HOST_NAME + Base58.encode(ldata.id)
    else
      ldata = Link.create(:long_url => params[:long_url])
      @surl = HOST_NAME + Base58.encode(ldata.id)
    end

    render :json => { :data => @surl }
  end
  
end
