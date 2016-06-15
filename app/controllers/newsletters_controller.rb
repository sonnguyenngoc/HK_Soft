class NewslettersController < ApplicationController
  
  # POST /newsletters
  # POST /newsletters.json
  def create
    @newsletter = Newsletter.new(newsletter_params)

    @newsletter.save
    redirect_to email_signup_success_path
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def newsletter_params
      params.require(:newsletter).permit(:email, :status, :user_id)
    end
end
