class API::V1::AirportsController < API::V1::BaseController
  include Pagy::Backend

  after_action { pagy_headers_merge(@pagy) if @pagy }
  
  def index
    @airports = Airport.all.order(passenger_volume: :desc)

    if params[:countries].present?
      @airports = @airports.where(country_alpha2: params[:countries])
    end

    # params[:per_page] = 5
    # params[:page] = 6

    @pagy, @records = pagy(@airports, items: params[:per_page], page: params[:page])

    render json: AirportSerializer.render(@records)
  end

end
