class ServicesController < ApplicationController
    def index
        @program_languages = ProgramLanguage.all
    end
    
    def services_sub_1
        @program_languages = ProgramLanguage.all
        @website_development = Article.get_website_development
    end
    
    def services_sub_2
        @program_languages = ProgramLanguage.all
        @web_based_software_development = Article.get_web_based_software_development
    end
    
    def services_sub_3
        @program_languages = ProgramLanguage.all
        @e_commerce = Article.get_e_commerce
    end
    
    def services_sub_4
        @program_languages = ProgramLanguage.all
        @google_apps_for_bussiness = Article.get_google_apps_for_bussiness
    end
    
    def services_sub_5
        @program_languages = ProgramLanguage.all
        @outsourcing = Article.get_outsourcing
    end
    
    def services_sub_6
        @program_languages = ProgramLanguage.all
        @research_and_development = Article.get_research_and_development
    end
    
    def services_sub_7
        @program_languages = ProgramLanguage.all
        @systems_integration = Article.get_systems_integration
    end
    
    def services_sub_8
        @program_languages = ProgramLanguage.all
        @email_marketing = Article.get_email_marketing
    end
end
