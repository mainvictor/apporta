class ChallengesController < ApplicationController
    before_action :set_challenge, only: [:show, :update, :destroy]
    # GET /challenges
    def index
        @challenges = Challenge.all
        json_response(@challenges)
    end

    # POST /challenges
    def create
        @challenge = Challenge.create!(challenge_params)
        json_response(@challenge,:created)
    end

    # GET /challenges/:id
    def show
        json_response(@challenge)
    end

    # PUT /challenges/:id
    def update
        @challenge.update(challenge_params)
        head :no_content
    end

    # DELETE /challenges/:id
    def destroy
        @challenge.destroy
        head :no_content
    end

    private

    def challenge_params
        params.permit(:title,:description,:start_at,:end_at,:media)
    end

    def set_challenge
        @challenge = Challenge.find(params[:id])
    end



end
