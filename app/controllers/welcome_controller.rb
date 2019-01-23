class WelcomeController < ApplicationController

  def landing_page
    @vendors = Vendor.all
  end

end
