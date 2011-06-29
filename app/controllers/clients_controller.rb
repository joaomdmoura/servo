class ClientsController < ApplicationController

  before_filter :find_all_clients
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @client in the line below:
    present(@page)
  end

  def show
    @client = Client.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @client in the line below:
    present(@page)
  end
  
  def login
    user = params[:login]
    pass = params[:pass]
    @client = Client.find_by_email_and_password( user, pass )
    if @client
      puts @client
    else
      url = root_path + "?error=Nenhum%20usu%C3%A1rio%20foi%20encontrado"
      redirect_to url
    end
  end

protected

  def find_all_clients
    @clients = Client.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/clients").first
  end

end
