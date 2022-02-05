# frozen_string_literal: true

# Controller for index of cities from search
class CitiesController < ApplicationController

  def index
    puts params
    search = params[:query].capitalize

    @cities = State.where('name LIKE ?', "%#{search}%").first&.cities

    @cities = City.where('name LIKE ?', "%#{search}%") if @cities.nil?

    render 'cities/index'
  end
end
