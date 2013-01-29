class ExperiencesController < ApplicationController
  resources only: [:edit, :update], nested_to: [:warriors]
end
