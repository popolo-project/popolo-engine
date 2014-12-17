require 'rails_helper'

module Popolo
  RSpec.describe PostsController, type: :controller do
    routes { Engine.routes }

    before :each do
      @post = FactoryGirl.create(:post)
    end

    describe 'GET show' do
      it 'assigns the requested post as @post' do
        get :show, {id: @post.to_param}
        expect(assigns(:post)).to eq(@post)
      end
    end
  end
end
