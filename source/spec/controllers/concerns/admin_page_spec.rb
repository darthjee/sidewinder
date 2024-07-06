# frozen_string_literal: true

require 'spec_helper'

describe AdminPage do
  # rubocop:disable RSpec/DescribedClass
  controller(ApplicationController) do
    include AdminPage

    def index; end
  end
  # rubocop:enable RSpec/DescribedClass

  context 'when requesting HTML without ajax' do
    let(:parameters) { {} }

    context 'when user is not logged' do
      before do
        get :index, params: parameters
      end

      it 'performs redirection to login page' do
        expect(response).to redirect_to('/#/login')
      end
    end

    context 'when user is logged but not as admin' do
      include_context 'with logged user', admin: false

      before do
        get :index, params: parameters
      end

      it 'performs redirection to forbidden page' do
        expect(response).to redirect_to('/#/forbidden')
      end
    end

    context 'when user is logged as admin' do
      include_context 'with logged user', admin: true

      before do
        get :index, params: parameters
      end

      it 'Performs regular angular redirection' do
        expect(response).to redirect_to('#/anonymous')
      end
    end
  end

  context 'when requesting HTML with ajax'do
    let(:parameters) { { ajax: true } }

    context 'when user is not logged' do
      before do
        get :index, params: parameters
      end

      it 'performs redirection to login page' do
        expect(response).to redirect_to('/#/login')
      end
    end

    context 'when user is logged but not as admin' do
      include_context 'with logged user', admin: false

      before do
        get :index, params: parameters
      end

      it 'performs redirection to forbidden page' do
        expect(response).to redirect_to('/#/forbidden')
      end
    end

    context 'when user is logged as admin' do
      include_context 'with logged user', admin: true

      before do
        get :index, params: parameters
      end

      it 'Performs regular angular redirection' do
        expect(response).to redirect_to('#/anonymous')
      end
    end
  end
end
