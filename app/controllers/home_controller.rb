class HomeController < ApplicationController
  class HomeController < ApplicationController
    def index
      redirect_to todos_path if user_signed_in?
    end
  end
end
