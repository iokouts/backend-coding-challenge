require 'rails_helper'

RSpec.describe 'API::V1::AirportsController', type: :request do
  describe 'index' do

    before do
      %i[fra muc zrh vie inn grz].each { |iata| create(:airport, iata) }
    end

    context 'index all' do
      subject(:airports_request) { json_get '/api/v1/airports'}

      it 'returns airports', :aggregate_failures do
        airports_request
        
        expect(response.status).to eq(200)
        expect(json.size).to eq(6)
      end

      it 'returns sorted airports', :aggregate_failures do
        airports_request

        expect(response.status).to eq(200)
        expect(json[0][:iata]).to eq('VIE')
        expect(json[1][:iata]).to eq('MUC')
        expect(json[2][:iata]).to eq('FRA')
      end
    end

    context 'filter by country' do
      it 'returns filtered airports', :aggregate_failures do
        json_get '/api/v1/airports', params: { countries: ['DE'] }

        expect(response.status).to eq(200)
        expect(json.size).to eq(2)
      end
    end

    context 'pagination' do
      it 'returns correct results 1', :aggregate_failures do
        json_get '/api/v1/airports', params: { per_page: 2, page: 1 }

        expect(response.status).to eq(200)
        expect(json.size).to eq(2)

        expect(json[0][:iata]).to eq('VIE')
        expect(json[1][:iata]).to eq('MUC')
      end

      it 'returns correct results 2', :aggregate_failures do
        json_get '/api/v1/airports', params: { per_page: 2, page: 2 }

        expect(response.status).to eq(200)
        expect(json.size).to eq(2)

        expect(json[0][:iata]).to eq('FRA')
        expect(json[1][:iata]).to eq('INN')
      end
    end

  end
end
