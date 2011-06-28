module NavigationHelpers
  module Refinery
    module Clients
      def path_to(page_name)
        case page_name
        when /the list of clients/
          admin_clients_path

         when /the new client form/
          new_admin_client_path
        else
          nil
        end
      end
    end
  end
end
