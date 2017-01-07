class LinksController < ApplicationController

  HOST_NAME = 'http://psh.ly/'
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
      #nothing found
      render :json => { :errors => "nothing found" }
    end
  end  

  def shorten    
    long_url = params[:long_url]
    ldata = Link.find_by_long_url(long_url)
    if ldata 
      @surl = HOST_NAME + Base58.encode(ldata.id)
    else
      ldata = Link.create(:long_url => long_url)
      @surl = HOST_NAME + Base58.encode(ldata.id)
    end

    render :json => @surl
  end
  
end
