class ChallengeDonationsController < ApplicationController

        before_action :set_challenge
        before_action :set_challenge_challenge_donation, only: [:show, :update, :destroy]
      
        # GET /challenges/:challenge_id/challenge_donations
        def index
          json_response(@challenge.challenge_donations)
        end
      
        # GET /challenges/:challenge_id/challenge_donations/:id
        def show
          json_response(@challenge_donation)
        end
      
        # POST /challenges/:challenge_id/challenge_donations
        def create
          @challenge.challenge_donations.create!(challenge_donation_params)
          json_response(@challenge, :created)
        end
      
        # PUT /challenges/:challenge_id/challenge_donations/:id
        def update
          @challenge_donation.update(challenge_donation_params)
          head :no_content
        end
      
        # DELETE /challenges/:challenge_id/challenge_donations/:id
        def destroy
          @challenge_donation.destroy
          head :no_content
        end
      
        private
      
        def challenge_donation_params
          params.permit(:media,:city,:description,:lat,:lng)
        end
      
        def set_challenge
          @challenge = Challenge.find(params[:challenge_id])
        end
      
        def set_challenge_challenge_donation
          @challenge_donation = @challenge.challenge_donations.find_by!(id: params[:id]) if @challenge
        end
end


