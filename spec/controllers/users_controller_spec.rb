require 'rails_helper'

module AccountBlock
  RSpec.describe UsersController, type: :controller do
    before(:each) do 
        @user = FactoryBot.create(:user) 
    end
    let(:create_user) do
      {
        "user":{
            "name": "TestUpdated1",
            "description": "energy@gmail.com"
        }
      }
    end
    describe 'GET #index user list' do
        it 'display all users' do
          get 'index'
          expect(response.status).to eq 200
        end
  
        it 'display with id' do
          get 'show' , params: { id: @user.id} 
          expect(response.status).to eq 200
        end

        it "create new user" do
          post 'new' , params: create_user
          expect(response.status).to eq 200
        end

        it 'will create user ' do
          post 'create', params: create_user, format: :json
          expect(response.status).to eq 200
          # expect(response.content_type).to eq('application/json')
          # expect(response).to have_http_status(:ok)
          # expect(response.body).to include(User.last.to_json)
        end 

        it "will update user" do
          post 'update', params: {id: @user.id}
          expect(response.status).to eq 200
        end

        it 'delete all users' do
          delete 'destroy', params: {id: @user.id }
          expect(response.status).to eq 200
        end
    end
  end   
end