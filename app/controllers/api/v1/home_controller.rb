class Api::V1::HomeController < Api::V1::BaseController
  def index
    @version = "V1.0.0"
  end
end
