class BuysController < ApplicationController
  def index
    @buy = Buy.all.order(created_at: :desc)
  end

  def create
  end
end
