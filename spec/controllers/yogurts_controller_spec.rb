require 'rails_helper'

RSpec.describe YogurtsController, :type => :controller do

  describe 'GET index' do
    let!(:yogurt1) { Yogurt.create!(flavor: 'chocolate', topping: 'oreos', quantity: 10.2) }
    let!(:yogurt2) { Yogurt.create!(flavor: 'chocolate', topping: 'oreos', quantity: 10.2) }

    before(:each) {
      get :index
    }

    it "is successful" do
      expect( response ).to be_success # 200
    end

    it "assigns all the yogurts to yogurts" do
      expect( assigns(:yogurts) ).to include(yogurt1, yogurt2)
    end

    it "renders the index view file" do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET show' do
    let!(:yogurt) { Yogurt.create!(flavor: 'ny cheese cake', topping: 'strawberries', quantity: 11.9) }
    let!(:not_the_yogurt) { Yogurt.create!(flavor: 'not ny cheese cake', topping: 'coal', quantity: 1.0) }

    before(:each) {
      get :show, id: yogurt.id
    }

    it "is successful" do
      expect( response ).to be_success # 200
    end

    it "renders the show view file" do
      expect( response ).to render_template(:show)
    end

    it "assigns the requested yogurt to a variable yogurt" do
      expect( assigns(:yogurt) ).to eq(yogurt)
    end
  end



  describe 'GET new' do
    it "is succesful" do
      get :new
      expect(response).to be_success
    end

    it "renders the new view file" do
      get :new
      expect(response).to render_template :new
    end

    it "assigns a new yogurt to a variable yogurt" do
      get :new
      expect(assigns(:yogurt)).to be_a(Yogurt)
    end

    it "doesn't save any new records" do
      expect{ get :new }.to change(Yogurt, :count).by(0)
    end
  end

  describe 'POST create' do

    context "when form is valid" do
      let!(:valid_attributes) do
        { flavor: 'raspberry', topping: 'whipped cream', quantity: 12.0 }
      end

      it "added a yogurt record" do
        expect{ post :create, yogurt: valid_attributes }.to change(Yogurt, :count).by(1)
      end

      it "redirects to the index" do
        post :create, yogurt: valid_attributes
        expect(response).to redirect_to yogurts_path
      end
    end

    context "when form is invalid" do
      let!(:bad_attributes) do
        { flavor: nil, topping: nil, quantity: nil }
      end

      it "does not add a yogurt record" do
        expect{ post :create, yogurt: bad_attributes }.to change(Yogurt, :count).by(0)
      end

      it "renders the new view file" do
        post :create, yogurt: bad_attributes
        expect(response).to render_template(:new)
      end
    end
  end

  ######## WE ENDED CLASS HERE #####################
  #
  # Edit, Update and Delete are below

  describe 'GET edit' do
    let!(:yogurt) { Yogurt.create!(flavor: 'green tea', topping: 'boba', quantity: 3.9) }

    before(:each) {
      get :edit, id: yogurt.id
    }

    it "is successful" do
      expect(response).to be_success
    end

    it "renders the edit view file" do
      expect(response).to render_template :edit
    end

    it "assigns the requested yogurt to a variable yogurt" do
      expect(assigns(:yogurt)).to eq(yogurt)
    end
  end

  describe 'PUT update' do
    let!(:yogurt) { Yogurt.create!(flavor: 'rootbeer', topping: 'whipped cream', quantity: 5.1) }

    context "with valid attributes" do
      let!(:valid_attributes) do
        { flavor: 'coco-cola', topping: 'whipped cream', quantity: 5.1 }
      end

      it "updates the existing yogurt" do
        put :update, id: yogurt.id, yogurt: valid_attributes
        expect(yogurt.reload.flavor).to eq(valid_attributes[:flavor])
        # expecting the yogurt to change from rootbeer to coca-cola
        # Notice, I need to call `reload` on our yogurt in order for Rails
        #   to pull in the change to the database. Otherwise the yogurt flavor will
        #   still be 'rootbeer' even though the DB column was successfully updated
        #   to 'coca-cola'.
      end

      it "redirects to the index" do
        put :update, id: yogurt.id, yogurt: valid_attributes
        expect(response).to redirect_to yogurts_path
      end
    end

    context "with bad attributes" do
      let!(:bad_attributes) do
        { flavor: nil, topping: nil, quantity: nil }
      end

      it "does not updates the existing yogurt" do
        put :update, id: yogurt.id, yogurt: bad_attributes
        expect(yogurt.reload.flavor).to eq(yogurt.flavor)
        # expecting the yogurt to remain coca-cola
        # Notice, using `reload` here for the same reason.
      end

      it "renders the edit view file" do
        put :update, id: yogurt.id, yogurt: bad_attributes
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    let!(:yogurt) { Yogurt.create!(flavor: 'mango', topping: 'coconut shavings', quantity: 4.3) }

    it "should assign the yogurt to a variable yogurt" do
      delete :destroy, id: yogurt.id
      expect(assigns(:yogurt)).to eq(yogurt)
    end

    it "should destroy a yogurt record" do
      expect{ delete :destroy, id: yogurt.id }.to change(Yogurt, :count).by(-1)
    end
  end
end
