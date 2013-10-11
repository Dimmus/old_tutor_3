module Dev
  class UsersController < BaseController

    def search
      handle_with(Admin::UsersSearch,
                  complete: lambda { render 'admin/users/search' })
    end

  end
end
