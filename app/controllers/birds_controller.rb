class BirdsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :bird_not_found

def index
    birds = Bird.all
    render json: birds
end

def show
    bird = Bird.find(params[:id])
    render json: bird
end

def create
    bird = Bird.create!(bird_params)
    render json: bird, status: :created
end

private

def bird_params
    params.permit(:name, :species)
end

def bird_not_found
    render json: {error: 'can not find your fucking bird!'}, status: 404
end

end
