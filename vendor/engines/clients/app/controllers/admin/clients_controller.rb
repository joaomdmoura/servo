module Admin
  class ClientsController < Admin::BaseController

    crudify :client,
            :title_attribute => 'name', :xhr_paging => true

  end
end
