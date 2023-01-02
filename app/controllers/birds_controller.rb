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

private

def bird_not_found
    render json: {error: 'can not find your fucking bird!'}, status: 404
end

end
