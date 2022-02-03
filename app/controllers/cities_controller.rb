class CitiesController < ApplicationController

  def index
    @cities = City.all
    binding.pry
    if params[:query].present?
      @cities = City&.where('name LIKE ?', "%#{params[:query]}%") || State&.where('name LIKE ?', "%#{params[:query]}%").first.cities
    end

    respond_to do |format|
      format.html
      format.text { render partial: 'list.html', locals: { cities: @cities } }
    end
  end
end
