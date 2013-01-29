class WeaponsController < ApplicationController
  resources except: [:edit, :update], nested_to: [:warriors]
end
