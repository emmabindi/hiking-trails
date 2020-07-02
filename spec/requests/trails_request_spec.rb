require 'rails_helper'

RSpec.describe "Trails", type: :request do
  describe 'GET #index' do 
    before(:example) do
      # Arrange
      @first_trail = create(:trail)
      @last_trail = create(:trail)
      # Act
      get '/trails'
      @json_response = JSON.parse(response.body)
    end
    
    # Assert
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'JSON response contains the correct number of entries' do
      expect(@json_response['trails'].count).to eq(2)
    end

    it 'JSON response body contains expected attributes' do 
      expect(@json_response['trails'][0]).to include({
        'id' => @first_trail.id,
        'name' => @first_trail.name,
        'difficulty' => @first_trail.difficulty
      })
    end
  end

  describe 'POST #create' do
    context 'when the trail is valid' do
      before(:example) do 
        @trail_params = attributes_for(:trail)
        post '/trails', params: { trail: @trail_params}
      end

      it 'returns http created' do
        expect(response).to have_http_status(:created)
      end

      it 'saves the Trail to the database' do
        expect(Trail.last.name).to eq(@trail_params[:name])
      end
    end

    context 'when the Trail has invalid attributes' do
      before(:example) do
        @trail_params = attributes_for(:trail, :invalid)
        post '/trails', params: { trail: @trail_params }
        @json_response = JSON.parse(response.body)
      end

      it 'returns http unprocessable entity' do 
        expect(response).to have_http_status(:unprocessable_entity)
      end
      
      it 'returns the correct number of errors' do
        expect(@json_response['errors'].count).to eq(2)
      end

      it 'errors contain the correct message' do 
        expect(@json_response['errors'][0]).to eq("Name can't be blank")
      end
    end
  end

  # ID of the one trail ?
  # describe 'POST #update' do 
  #   context 'when the trail is valid' do 
  #     before(:example) do 
  #       @trail_params = attributes_for(:trail)
  #       post "/trails#{@trail.id}", params: { trails: @trail_params }
  #   end

  #   it 'returns http 200' do 
  #     expect(response).to have_http_status(200)
  #   end

  #   it 'saves the Trail to the database' do
  #     # expect(@trail(params[:id]).name).to eq(@trail_params[:name])
  #   end
  # end

  # context 'when the Trail has invalid attributes' do
  #   before(:example) do
  #     @trail_params = attributes_for(:trail, :invalid)
  #     post "/trails/#{@trail.id}", params: { trail: @trail_params }
  #     @json_response = JSON.parse(response.body)
  #   end

  #   it 'returns http unprocessable entity' do 
  #     expect(response).to have_http_status(:unprocessable_entity)
  #   end
    
  #   it 'returns the correct number of errors' do
  #     expect(@json_response['errors'].count).to eq(2)
  #   end

  #   it 'errors contain the correct message' do 
  #     expect(@json_response['errors'][0]).to eq("Name can't be blank")
  #   end
  # end

  describe 'DELETE #destroy' do 
    context 'when the trail is valid' do 
      before(:example) do
        @trail = create(:trail)
        delete "/trails/#{@trail.id}"
      end

      it 'returns http deleted' do
        expect(response).to have_http_status(200) 
      end

      # it 'deletes the Trail from the database' do
        # expect(Trail.last.name).to eq(@trail_params[:name])
      # end
    end
  end
end
