require 'spec_helper'

describe MonstersController do

  let(:monster) { Monster.create!(name: 'Bat',
                                  description: 'a scourge on the skies',
                                  visual_desc: 'tiny, pesky',
                                  exp: 50,
                                  cr: '.125',
                                  type: 'animal',
                                  environment: 'cool deserts') }
  let(:monster1) { Monster.create!(name: 'Monkey',
                                   description: 'a scourge on the trees',
                                   visual_desc: 'big, pesky',
                                   exp: 100,
                                   cr: '.5',
                                   type: 'animal',
                                   environment: 'warm deserts') }

  describe "GET 'index'" do

    it 'is successful' do
      get :index
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'has the body class of @monsters' do
    end

    it 'loads all the monsters' do
      get :index
      expect(assigns(:monsters)).to match_array([monster, monster1])
    end
  end # End GET index

  describe 'Create a new monster page' do

    it 'is successful' do
      get :new
      expect(response).to be_successful
    end

    it 'should create a new monster' do
      get :new
      post 'create', {monster:    { name: 'Monkey',
                                    description: 'a scourge on the trees',
                                    visual_desc: 'big, pesky',
                                    exp: 100,
                                    cr: '.5',
                                    type: 'animal',
                                    environment: 'warm deserts' } }
      expect(response).to redirect_to(monsters_path)
    end

    it 'should increase the Monster count by 1' do
      get :new
        expect { post 'create', { monster: { name: 'Monkey',
                                             description: 'a scourge on the trees',
                                             visual_desc: 'big, pesky',
                                             exp: 100,
                                             cr: '.5',
                                             type: 'animal',
                                             environment: 'warm deserts' } 
                                } 
                }.to change(Monster, :count).by(1)
    end

    it "should render the new template if the monster isn't saved" do
      get :new
      post 'create', { monster:  { name: 'Monkey',
                                   # description: 'a scourge on the trees',
                                   # description removed so monster is invalid
                                   visual_desc: 'big, pesky',
                                   exp: 100,
                                   cr: '.5',
                                   type: 'animal',
                                   environment: 'warm deserts' } }
      expect(response).to render_template(:new)
    end
  end # Ends create a new monster page

  describe 'Monster show page' do
    render_views

    let(:request) { get :show, id: monster.id }

    it 'should be successful' do
      request
      expect(response).to be_successful
    end

    it 'should have a body_class of show_monsters' do
    end
  end # Ends 'Monster show page'

  describe 'Updating monsters' do

    it 'should redirect if not davida' do
      @current_nerd.name = 'davida'
      get :edit
      expect(response).to be_redirect
    end

    it 'does update params' do
      monster = Monster.create(name: 'Bat',
                description: 'a scourge on the skies',
                visual_desc: 'tiny, pesky',
                exp: 50,
                cr: '.125',
                type: 'animal',
                environment: 'cool deserts')
      patch :update, id: monster.id, monster: {
                                       type: 'vermin' }

      expect(response).to be_redirect
    end

    it "should render the edit view if the monster isn't saved" do
      monster = Monster.create(name: 'Bat',
                description: 'a scourge on the skies',
                visual_desc: 'tiny, pesky',
                exp: 50,
                cr: '.125',
                type: 'animal',
                environment: 'cool deserts')
      patch :update, id: monster.id, monster: {
                                          exp: '-10'
      }

      expect(response).to render_template(:edit)
    end
  end # ends 'updating monsters'

end
