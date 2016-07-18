class NewslettersController < ApplicationController
  before_action :set_newsletter, only: [:show, :edit, :update, :destroy]

  # POST /newsletters
  # POST /newsletters.json
  def create
    # authorize
    @newsletter = Newsletter.new(newsletter_params)


    if @newsletter.save
      redirect_to controller: "home", action: "newsletter_success"
    #else
    #  flash[:newsletter_email_invalid] = "Email không hợp lệ!"
    #  redirect_to(:back)
    end

  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def newsletter_params
      params.require(:newsletter).permit(:email)
    end
end
