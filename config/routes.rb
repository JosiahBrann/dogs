# frozen_string_literal: true

Rails.application.routes.draw do
  resources :dogs do
    get 'search', on: :collection
  end
end
